# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-solid
_pkgname=arc-theme
_pkgauthor=horst3180
pkgver=20161005
pkgrel=1
pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell. Official releases only with transparency disabled."
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
provides=("gtk-theme-arc=${pkgver}")
conflicts=('gtk-theme-arc' 'gtk-theme-arc-git')
source=("https://github.com/${_pkgauthor}/${_pkgname}/archive/$pkgver.tar.gz")
sha256sums=('09167228e286c3decedd2197ed6915d70d8601e7274f81cd368ac097f6c4f7e4')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr --disable-transparency
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}
