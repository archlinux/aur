# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx-lxqt-plugin
pkgver=0.9
pkgrel=1
pkgdesc="DockBarX LXQT applet"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/xuzhen/dockbarx-lxqt-plugin"
license=('GPL3')
depends=('dockbarx' 'lxqt-panel' 'qt5-x11extras')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")	
sha256sums=('f61222d8a1a01ec2140860251cba9ff7107fcea606560324440d91b58d4e9c4d')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
  cd "${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}
