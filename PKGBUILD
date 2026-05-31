# Maintainer: santarelli <santarellihectorm@gmail.com>
pkgname=bombini
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightning-fast, fuzzy-matching application launcher daemon written in C"
arch=('x86_64')
url="https://github.com/manuelsanta06/bombini"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manuelsanta06/bombini/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea0bc157ac812c6d57ca05e046e2365b524a3db5ec8e3b871b9e78e7b7fed424')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
