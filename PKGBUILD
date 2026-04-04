pkgname=playcli
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI audio player built with Go and Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/TimexDeveloper/playcli"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TimexDeveloper/$pkgname/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-main"
  go build -o "$pkgname" -ldflags="-s -w"
}

package() {
  cd "$srcdir/$pkgname-main"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
