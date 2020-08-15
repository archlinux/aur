# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma5-applets-plastweet
pkgver=0.1
pkgrel=2
pkgdesc="A small plasmoid to send tweets directly from the desktop"
arch=('x86_64')
url="https://github.com/gustawho/plastweet"
license=('GPL3')
depends=('plasma-workspace' 'jsoncpp' 'curl')
makedepends=('extra-cmake-modules' 'git')
source=("${pkgname}-${pkgver}::git+${url}.git#commit=6613b7b0ce2cc3229770c1e92a736f5e7daa7cd1")
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
