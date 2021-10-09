
#Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.15.0
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('a8980f00810f5d614f467d80a97598c8ff923e760678f54b173fe9def7811c7f')
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
