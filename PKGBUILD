# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-solid
_pkgname=arc-theme
pkgver=20160605
pkgrel=1
pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell. Official releases only with transparency disabled."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
provides=("gtk-theme-arc=${pkgver}")
conflicts=('gtk-theme-arc' 'gtk-theme-arc-git')
source=("https://github.com/horst3180/${_pkgname}/archive/$pkgver.tar.gz")
md5sums=('6d5396b42814bf5e9f644b68cc47f9c5')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr --disable-transparency
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}
