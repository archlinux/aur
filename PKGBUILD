pkgname=perkbox
pkgver=0.4.5
pkgrel=1
pkgdesc="Local console-based password manager"
arch=('x86_64')
url="https://github.com/MRivSilv/perkbox"
license=('MIT')
makedepends=('go')
depends=('xclip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9039bb176314de9adad7f5f98af5ac00bda1deef39684ca3c78c594f7946faf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags='-s -w' -o perkbox .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 perkbox "$pkgdir/usr/bin/perkbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
