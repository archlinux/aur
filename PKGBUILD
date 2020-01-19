# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=surgescript
pkgver=0.5.4.2
pkgrel=1
pkgdesc='SurgeScript is a scripting language for games.'
arch=('i686' 'x86_64')
url='https://github.com/alemart/surgescript'
license=('Apache-2.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/surgescript/archive/v$pkgver.tar.gz")
sha256sums=('e0918000682a6db4b6db008fa4c674abb0a8cd34867164a7e6058f8ce304c172')

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
