# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid
pkgver=0.0.6
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kupych/rapid/archive/v$pkgver.tar.gz")
sha256sums=('244caf5e3417869f4b472110410f1655a49d7c4a22ed3fd9888a14d87e23feaf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o rapid
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
