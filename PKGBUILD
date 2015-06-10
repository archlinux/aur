# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=spl
pkgver=1.0pre6
pkgrel=1
pkgdesc='SPL Programming Language'
url='http://www.clifford.at/spl/'
license=('GPL2')
makedepends=('setconf')
arch=('x86_64' 'i686')
source=("http://www.clifford.at/spl/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('737658aea624f17ede8bb965b89cbd4acf40148906c55d3eebc8cc34d1755c30')

prepare() {
  setconf "$pkgname-$pkgver/GNUmakefile" prefix /usr
}

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
} 

# vim:set ts=2 sw=2 et:
