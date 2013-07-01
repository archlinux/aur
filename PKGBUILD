# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgname=fcitx-cloudpinyin
pkgver=0.3.2
pkgrel=1
pkgdesc='Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-cloudpinyin"
license=('GPL')
depends=('curl' 'fcitx>=4.2.7')
makedepends=('cmake')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-$pkgver.tar.xz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}

sha512sums=('ddda528f72ffd200ae78b4b2d9791e20576a220d0b15e4c55e9bd1977188c65696ca2a522acbb27177b2b22b33cdc41774d1ce111eb090adaba8fcc97f12cd8e')
