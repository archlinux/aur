# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-sunpinyin
pkgver=0.3.9
pkgrel=1
pkgdesc="Fcitx Wrapper for sunpinyin."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
install='fcitx-sunpinyin.install'
depends=('fcitx>=4.2.5' 'sunpinyin>2.0.3')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)
md5sums=('de221daa7b3790b22f5a95d7091d0e38')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  rm -rf build
  mkdir build
  cd build
    
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
