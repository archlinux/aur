pkgname=figgy
pkgver=1.0.1
pkgrel=1
pkgdesc="A modern colorful FIGLET-style TUI using Bubble Tea and Lipgloss"
arch=('x86_64' 'aarch64')
url="https://github.com/jd3b/figgy"
license=('MIT')
depends=()
makedepends=('go')

source=("https://github.com/jd3b/figgy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/figgy-$pkgver"
  go mod download
  go build -o figgy .
}

package() {
  cd "$srcdir/figgy-$pkgver"
  install -Dm755 figgy "$pkgdir/usr/bin/figgy"
}


