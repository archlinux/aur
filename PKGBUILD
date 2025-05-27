
#Maintainer: atriix <aur a snilius d com>

pkgname=migrate
pkgver=4.18.3
pkgrel=1
pkgdesc="Database migration handling"
url="https://github.com/golang-migrate/migrate"
arch=("x86_64")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/golang-migrate/migrate/archive/v$pkgver.tar.gz")
sha256sums=('473342da619ce55bdb15e5ebcbcb6c798286b5dbd3f84f2884696b5cbe5d3d87')
makedepends=("go")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build VERSION=$pkgver
}

package() {
  install -d "${pkgdir}/usr/bin"
  mv "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
