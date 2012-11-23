# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.0
pkgrel=2
pkgdesc="Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates"
arch=('i686' 'x86_64')
url="https://github.com/csslayer/fcitx-cloudpinyin"
license=('GPL')
depends=('curl' 'fcitx>=4.2.6')
makedepends=('cmake' 'intltool')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")
md5sums=('8bffd65fe2172d61edde46ad53380150')

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
  make DESTDIR="$pkgdir" install
}
