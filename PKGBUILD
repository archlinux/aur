pkgname=perkbox
pkgver=0.4.6
pkgrel=1
pkgdesc="Local console-based password manager"
arch=('x86_64')
url="https://github.com/MRivSilv/perkbox"
license=('MIT')
makedepends=('go')
depends=('xclip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25816e37e77b931f15552bfdd09665f3f2ab32e8b11c3fa763795a11fd777399')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags='-s -w' -o perkbox .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 perkbox "$pkgdir/usr/bin/perkbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
