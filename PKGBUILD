
#Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.14.1
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('c4bb59dd2a1c99980b453f37d0838d292aef9feab86ff5ec230f13e097761017')
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
