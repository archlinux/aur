
#Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.18.1
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('06cb38c81f0152670c730e906a27f49b353958fe90dcdf9f90f318785c19977f')
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
