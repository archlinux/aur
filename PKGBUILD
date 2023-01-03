# Contributor: twa022 <twa022 at gmail dot com>

pkgname=xfce4-dockbarx-plugin
epoch=1
pkgver=0.7.1
pkgrel=2
pkgdesc="Embed DockbarX in the xfce4-panel"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
#url="https://github.com/m7s/xfce4-dockbarx-plugin"
url="https://github.com/xuzhen/xfce4-dockbarx-plugin"
license=('X11')
depends=('dockbarx>=1.0beta' 'xfce4-panel')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('57b4f183a3a8f0ce3385502af95c5ff1fde49132dee81d2b036653c9802584bd')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d build ] && rm -fr build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make  
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}

