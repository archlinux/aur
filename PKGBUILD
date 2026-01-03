pkgname=gti-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast, lightweight and terminal based typing speed and practice application."
arch=('any')
url="https://github.com/developic/gti"
license=('MIT')
depends=()
makedepends=('go>=1.19')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
options=(!debug)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags="-s -w" -o gti
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gti "$pkgdir/usr/bin/gti"
  install -Dm644 gti.1.gz "$pkgdir/usr/share/man/man1/gti.1.gz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
