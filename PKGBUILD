pkgname=deadbeef-plugin-statusnotifier
pkgver=1.6
pkgrel=1
pkgdesc="StatusNotifier plugin for the DeaDBeeF music player replaces default tray icon on DE that supports StatusNotifierIitem protocol."
url="https://github.com/vovochka404/deadbeef-statusnotifier-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/vovochka404/deadbeef-statusnotifier-plugin/archive/v${pkgver}.tar.gz")
depends=('deadbeef' 'gtk3' 'gtk2' 'libdbusmenu-glib')
makedepends=('cmake')
sha512sums=('82e584b4614371a17ef89be94d87804bc3c55ae806a001bc489ca8041deff0aba29e0525b533f7fd3ccfc188adcaac62dd51418e7d0d2377222873baedddc9e5')

build() {
  cmake "${srcdir}/deadbeef-statusnotifier-plugin-${pkgver}" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DUSE_GTK=OFF
	make
}

package() {
	cd "${srcdir}" && make install
}
