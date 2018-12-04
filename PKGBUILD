# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.0.3
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
sha256sums=('45f8c7d4313b02b0b5fe477275d8d43524f2e31abf1dc3fccb99cf2ff46c802b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}
