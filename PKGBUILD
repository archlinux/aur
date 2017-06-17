# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=us_da-layout
pkgver=r1.85115d7
pkgrel=2
pkgdesc="US keyboard layout with level 3-4 æøå"
arch=('any')
url="https://gist.githubusercontent.com/Tyilo/d329020017ca37bf0d23264230637120"
license=('GPL')
depends=('kbd' 'moreutils')
source=("us_da::git+https://gist.githubusercontent.com/Tyilo/d329020017ca37bf0d23264230637120")
md5sums=('SKIP')
install=us_da-layout.install

pkgver() {
	cd "${srcdir}/us_da"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 644 "${srcdir}/us_da/us_da" "${pkgdir}/usr/share/X11/xkb/symbols/us_da"
}
