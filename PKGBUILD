# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma5-applets-plastweet
pkgver=0.1
pkgrel=1
pkgdesc="A small plasmoid to send tweets directly from the desktop"
arch=('any')
url="https://github.com/gustawho/plastweet"
license=('GPL3')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}-alpha.tar.gz")
sha256sums=('30c5a6a362f4951594475791d3e304a2079c034b1a185bec2e366a3ee4cc7508')

build() {
  mkdir -p ${srcdir}/plastweet-${pkgver}-alpha/build
  cd ${srcdir}/plastweet-${pkgver}-alpha/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd ${srcdir}/plastweet-${pkgver}-alpha/build
  make DESTDIR="$pkgdir" install
}
