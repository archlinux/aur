# Maintainer: Michael Schuh <michael.schuh.34@gmail.com>
pkgname=pons-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="An unofficial simple CLI tool to look up translations via the Pons API. This project is not affiliated with Pons or its services."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mikachou/pons-cli"
license=('MIT')
depends=('sqlite')
makedepends=('go')
source=("https://github.com/mikachou/pons-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c13d7585989b13582cfbb443f24a93013ce6cb24ebb505a10832581d55a0bd08')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o pons-cli .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 pons-cli "$pkgdir/usr/bin/pons-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
