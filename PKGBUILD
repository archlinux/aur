# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=surgescript
pkgver=0.5.4.3
pkgrel=1
pkgdesc='SurgeScript is a scripting language for games.'
arch=('i686' 'x86_64')
url='https://github.com/alemart/surgescript'
license=('Apache-2.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/surgescript/archive/v$pkgver.tar.gz")
sha256sums=('52bb460b3a882788cc1001610d35f56a9c206b4f565db593a507f69862d6270c')

build() {
  cd $pkgname-$pkgver

  mkdir build && cd build

  cmake ..
  make
}

package() {
  cd $pkgname-$pkgver/build

  make DESTDIR="$pkgdir/" install
}
