# Maintainer: Alexander Breckel
# Maintainer: Jente Hidskes <hjdskes@gmail.com>
pkgname=arch-diff
pkgver=0.2
pkgrel=2
pkgdesc="Perform a full diff between all pacman packages and the file system"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/aneas/arch-diff"
license=('MIT')
depends=('pacman' 'zlib')
source=("https://github.com/aneas/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('96dfb15e4bfd2a3c4906b25354ce17f8')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
