# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.0.2
pkgrel=1
pkgdesc="Installs and manages Minecraft mods with ease"
arch=('x86_64')
url="https://github.com/fiws/minepkg"
license=('MIT')
groups=()
depends=()
makedepends=('go')
optdepends=('docker')
source=("https://github.com/fiws/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b229d0dc6723e9d41479934159783235e2034a200f714fdb3991b05343535e71')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}
