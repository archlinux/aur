# Maintainer: Anagastes

pkgname=v4l2ucp-qt5
pkgver=2.0.2
pkgrel=1
pkgdesc="A universal control panel for Video for Linux Two (V4L2) devices (QT5-Fork)"
arch=('x86_64')
url="https://github.com/smunaut/v4l2ucp-qt5"
license=('GPL2')
depends=('qt5-base' 'v4l-utils')
conflicts=('v4l2ucp')
optdepends=('mplayer: video preview')
makedepends=('cmake')
source=("https://github.com/smunaut/v4l2ucp-qt5/archive/refs/heads/master.zip")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}-master"

  mkdir -vp build
}

build() {
  cd "${pkgname}-master/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd "${pkgname}-master/build"
  make DESTDIR="$pkgdir/" install
}
