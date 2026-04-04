pkgname=playcli
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI audio player built with Go and Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/TimexDeveloper/playcli"
license=('MIT')
depends=('ffmpeg')
makedepends=('go' 'git')
source=("git+https://github.com/TimexDeveloper/$pkgname.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  go build -o "$pkgname" -ldflags="-s -w"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
