# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma5-applets-plastweet
pkgver=0.2
pkgrel=1
pkgdesc="A small plasmoid to send tweets directly from the desktop"
arch=('x86_64')
url="https://github.com/gustawho/plastweet"
license=('GPL3')
depends=('plasma-workspace' 'jsoncpp' 'curl')
makedepends=('extra-cmake-modules' 'git')
source=("${pkgname}-${pkgver}::git+${url}.git#commit=fc367a8b5c82b34cf94d6d7ebfeb5835a8bd796f")
sha256sums=('SKIP')

build() {
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
