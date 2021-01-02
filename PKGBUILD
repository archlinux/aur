# Maintainer: Doommsatic <keniscoolu@gmail.com>
pkgname=khinsider
pkgver=r68.d2d031a
pkgrel=1
pkgdesc="A script for mass downloads from downloads.khinsider.com"
arch=('any')
url="https://github.com/obskyr/khinsider"
license=('unknown')
depends=('python')
makedepends=('git')
source=('git+https://github.com/obskyr/khinsider.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -Dm755 khinsider.py "${pkgdir}/usr/bin/khinsider"
	install -Dm644 readme.md "${pkgdir}/usr/share/doc/khinsider/readme.md"
}
