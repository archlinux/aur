# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc
_pkgname=Arc-theme
pkgver=20150922
pkgrel=1
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. Official releases only."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("https://github.com/horst3180/${_pkgname}/archive/$pkgver.tar.gz")
sha256sums=('4cd69ce3fd611034c4d6be88840a23e8b9d3b6c95511459e764ff24e9e512e07')
conflicts=('gtk-theme-arc-git')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}