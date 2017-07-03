# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=albert-pass
pkgver=r11.64b6107
pkgrel=1
pkgdesc="Albert extension for pass"
arch=('any')
url="https://github.com/Tyilo/albert-extensions"
license=('GPL')
depends=('albert' 'pass')
source=("git+https://github.com/Tyilo/albert-extensions")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/albert-extensions"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D "${srcdir}/albert-extensions/pass.py" "${pkgdir}/usr/share/albert/external/pass.py"
}
