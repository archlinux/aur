pkgname=perkbox
pkgver=0.4.0
pkgrel=1
pkgdesc="Local console-based password manager"
arch=('x86_64')
url="https://github.com/MRivSilv/perkbox"
license=('MIT')
makedepends=('go')
depends=('xclip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23f568b752c2f23d2f7c7d6ac3e3e7ee1589f720594513f381a4ab0d37041395')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -trimpath -ldflags='-s -w' -o perkbox .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 perkbox "$pkgdir/usr/bin/perkbox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
