pkgname=perkbox
pkgver=0.2.0
pkgrel=1
pkgdesc="Local console-based password manager"
arch=('x86_64')
url="https://github.com/MRivSilv/perkbox"
license=('MIT')
makedepends=('go')
depends=('xclip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f98986cc5ae30a5b8e9ac1d6e72c12881c03650f6a989a47b9ff41334d1d79b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags='-s -w' -o perkbox .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 perkbox "$pkgdir/usr/bin/perkbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
