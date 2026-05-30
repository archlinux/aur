pkgname=perkbox
pkgver=0.3.0
pkgrel=1
pkgdesc="Local console-based password manager"
arch=('x86_64')
url="https://github.com/MRivSilv/perkbox"
license=('MIT')
makedepends=('go')
depends=('xclip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c6428a1863b9a13eced570b99323e2bdc944ae8214677db639c84f5c9c9b441')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags='-s -w' -o perkbox .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 perkbox "$pkgdir/usr/bin/perkbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
