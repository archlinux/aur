# Maintainer: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de

pkgname=gtk-theme-arc
_pkgname=Arc-theme
pkgver=20151002
pkgrel=1
pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell. Official releases only."
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
source=("https://github.com/horst3180/${_pkgname}/archive/$pkgver.tar.gz")
conflicts=('gtk-theme-arc-git')
md5sums=('698f0909aa51b1eeaf795a1f7e670004')

build() {
	cd "${_pkgname}-$pkgver"
	./autogen.sh --prefix=/usr
}

package() {
	make -C "${_pkgname}-$pkgver" DESTDIR="${pkgdir}" install
}
