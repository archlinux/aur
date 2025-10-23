# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid
pkgver=0.0.1
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kupych/rapid/archive/v$pkgver.tar.gz")
sha256sums=('3422e2ed0fe6505bda058ac59f77284d2d936f95f4c801b3ca46ccf115b00997')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o rapid
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
