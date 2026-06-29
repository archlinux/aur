# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid
pkgver=0.6.0
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kupych/rapid/archive/v$pkgver.tar.gz")
sha256sums=('16afd2c30ec2d87a19550638ea829b6ced59ba5ffb6262dd32d4b91a39767bf6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o rapid
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
