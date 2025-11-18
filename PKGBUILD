# Maintainer: Stefan Kupych <stefan@kupy.ch>
#
pkgname=rapid
pkgver=0.2.8
pkgrel=1
pkgdesc="Rapid API Dialogue - A REPL for APIs"
arch=('x86_64')
url="https://github.com/kupych/rapid"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kupych/rapid/archive/v$pkgver.tar.gz")
sha256sums=('8ab4f850ace6683cd7062894b4b3add887d23f2f5f60157b620b2ff53642fe1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o rapid
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 rapid "$pkgdir/usr/bin/rapid"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
