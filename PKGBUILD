# Maintainer: santarelli <santarellihectorm@gmail.com>
pkgname=bombini
pkgver=1.2.0
pkgrel=1
pkgdesc="A lightning-fast, fuzzy-matching application launcher daemon written in C"
arch=('x86_64')
url="https://github.com/manuelsanta06/bombini"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manuelsanta06/bombini/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72b751895e2fb746dc88b4b53359292032e762190429a1adbbfb2f737abde7e9')

build() {
  cd "$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
