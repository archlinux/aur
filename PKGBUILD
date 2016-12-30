# Maintainer: Ethan Kiang <chocopuff298+arch@gmail.com>
# Contributor: Lari Tikkanen <lartza@wippies.com>
# Contributor: Stefan Stojanovic <eastapolo00@yahoo.com>
pkgname=snapcraft-gui
pkgver=3.0
pkgrel=1
pkgdesc="Graphical user interface to create snaps using Snapcraft as the backend"
arch=('i686' 'x86_64')
url="http://snapcraft.io/"
license=('GPL')
depends=('qt5-base' 'snapcraft' 'tree')
optdepends=('pastebinit: pastebin.com integration')
source=(https://github.com/snapcraft-gui/snapcraft-gui/releases/download/${pkgver}/snapcraft-gui_${pkgver}.tar.xz)
md5sums=('98da2545d1b01c6f74fb463cb2e1b89e')

build() {
cd "${srcdir}/build"
qmake
make
}

package() {
cd "${srcdir}/build"

#Binaries	
install -Dm 755 ./snapcraft-gui "$pkgdir/usr/bin/snapcraft-gui"
}

