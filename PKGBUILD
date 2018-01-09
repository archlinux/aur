# Maintainer: xgdgsc <xgdgsc at gmail.com>
pkgname=deadbeef-plugin-statusnotifier
pkgver=1.3
pkgrel=1
pkgdesc="Plugin that provides system tray icon for deadbeef in Plasma5 (Just implements StatusNotifierItem)."
url="https://github.com/vovochka404/deadbeef-statusnotifier-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
source=("https://github.com/vovochka404/deadbeef-statusnotifier-plugin/archive/v${pkgver}.tar.gz")
depends=('deadbeef' 'gtk3' 'gtk2' 'libdbusmenu-glib')
makedepends=('cmake')
md5sums=('807e81cd8b8e18c4d673a418551c2a4b')

build() {
  cmake "${srcdir}/deadbeef-statusnotifier-plugin-${pkgver}" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DUSE_GTK=OFF
	make
}

package() {
	cd "${srcdir}" && make install
}
