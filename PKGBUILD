# Maintainer: santarelli <santarellihectorm@gmail.com>
pkgname=bombini
pkgver=1.0.2
pkgrel=1
pkgdesc="A lightning-fast, fuzzy-matching application launcher daemon written in C"
arch=('x86_64')
url="https://github.com/manuelsanta06/bombini"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manuelsanta06/bombini/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d8cf14d27be614b5cb44cb3008363905cdacfd00528bd20899218b7518453356')

build() {
  cd "$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
