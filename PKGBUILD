# Contributor: twa022 <twa022 at gmail dot com>

pkgname=xfce4-dockbarx-plugin
epoch=1
pkgver=0.7.3
pkgrel=1
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
#url="https://github.com/m7s/xfce4-dockbarx-plugin"
url="https://github.com/xuzhen/xfce4-dockbarx-plugin"
license=('GPL-3.0-or-later')
depends=('dockbarx' 'xfce4-panel')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68d106b2446b89b90423cec00f24f999223fd289ad712bb807eb918670b91eec')

prepare() {
  cd "${pkgname}-${pkgver}"
  [ -d build ] && rm -fr build
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make  
}

package() {
  cd "${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}

