# Maintainer: Alexander Breckel
pkgname=arch-diff
pkgver=0.1
pkgrel=1
pkgdesc="Perform a full diff between all pacman packages and the file system"
arch=('i686' 'x86_64')
url="https://github.com/aneas/arch-diff"
license=('MIT')
depends=('pacman' 'zlib')
source=("https://github.com/aneas/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('5cc1d71a9cd84063ad1d099e4fb4e6a5')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
