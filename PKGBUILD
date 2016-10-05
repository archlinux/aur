# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc
_pkgname=arc-theme
_pkgauthor=horst3180
pkgver=20161005
pkgrel=1
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. Official releases only."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/$pkgver.tar.gz")
conflicts=('gtk-theme-arc-git')
provides=('gtk-theme-arc')
sha256sums=('09167228e286c3decedd2197ed6915d70d8601e7274f81cd368ac097f6c4f7e4')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}
