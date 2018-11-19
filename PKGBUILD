# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.0.1
pkgrel=2
pkgdesc="Installs and manages Minecraft mods with ease"
arch=('x86_64')
url="https://github.com/fiws/minepkg"
license=('MIT')
groups=()
depends=()
makedepends=('go')
optdepends=('docker')
source=("https://github.com/fiws/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9ca225e0baf0fb6d755436d27fc9a18deadbb560167a1c121dff3cbacb2b95d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}