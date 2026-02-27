pkgname=minical
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight TUI calendar."
arch=('x86_64')
url="https://github.com/raand0/minical"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/raand0/minical/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  go build -o minical
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/src/minical" "$pkgdir/usr/bin/minical"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('e1c793e427fff044cad7f4741984ee4761105a18207a32eb695e3890bc757e51')
