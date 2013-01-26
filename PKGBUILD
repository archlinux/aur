# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-chewing
pkgver=0.2.0
pkgrel=1
pkgdesc='Fcitx Wrapper for chewing'
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-chewing"
license=('GPL')
depends=('libchewing' 'fcitx>=4.2.7')
makedepends=('cmake')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  mkdir -p build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir" install
}
md5sums=('d4dacf213673b5cac50db41427eb6b35')
