# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=surgescript
pkgver=0.5.5
pkgrel=1
pkgdesc='SurgeScript is a scripting language for games.'
arch=('i686' 'x86_64' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/alemart/surgescript'
license=('Apache-2.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alemart/surgescript/archive/v$pkgver.tar.gz")
sha256sums=('c9f59131d5cd921a11fb1335fe93bd754f4b1eefa1ed95aaa0343a28437f3f78')

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
