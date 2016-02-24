# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc-solid
_pkgname=arc-theme
pkgver=20151214
pkgrel=1
pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell. Official releases only with transparency disabled."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("https://github.com/horst3180/${_pkgname}/archive/$pkgver.tar.gz")
conflicts=('gtk-theme-arc' 'gtk-theme-arc-git')
md5sums=('aedd4103e09b4c341b9afe318f252f27')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr --disable-transparency
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}
