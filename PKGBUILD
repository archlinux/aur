# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx-lxqt-plugin
pkgver=0.9.4
pkgrel=1
pkgdesc="DockBarX LXQT applet"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/xuzhen/dockbarx-lxqt-plugin"
license=('GPL-3.0-or-later')
depends=('dockbarx' 'lxqt-panel' 'qt6-base')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67019459e808530ace5c5875eb11f295f7a5e504c1c157c39fa0fa27f8aeb230')

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
