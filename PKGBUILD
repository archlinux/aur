# Maintainer: Adam Ferrick <adameferrick at gmail dot com>

pkgname=kak-bundle-git
pkgver=r116.5f479e8
pkgrel=1
pkgdesc="A plugin manager for Kakoune designed for speed without sacrificing utility."
arch=('any')
url="https://codeberg.org/jdugan6240/kak-bundle"
license=('0BSD')
depends=('kakoune')
makedepends=('git')
install=${pkgname}.install
source=(${pkgname}::git+https://codeberg.org/jdugan6240/kak-bundle)
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm 644 ${pkgname}/rc/kak-bundle.kak "${pkgdir}"/usr/share/kak/rc/bundle/kak-bundle.kak
	install -Dm 644 ${pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
