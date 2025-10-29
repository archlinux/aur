# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid
pkgver=0.0.4
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kupych/rapid/archive/v$pkgver.tar.gz")
sha256sums=('b62307fd4048413edaa08ab9fc50dd20a1db6bbe9924a3eb532d7bbab0060efa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o rapid
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
