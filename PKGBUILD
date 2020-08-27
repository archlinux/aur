
#Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.12.2
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('fa86fe006974551ff279ef3cef1b9855935579be4bcdf07a0732fb791903b5f3')
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
