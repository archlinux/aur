# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.0.1
pkgrel=1
pkgdesc="Installs and manages Minecraft mods with ease"
arch=('x86_64')
url="https://github.com/fiws/minepkg"
license=('MIT')
groups=()
depends=()
makedepends=('go')
optdepends=('docker')
source=("https://github.com/fiws/$pkgname/archive/v$pkgver-beta.tar.gz")
sha1sums=('67c59d7f04555b22a08e0bf611a91822ea817c9b')

build() {
  cd "$srcdir/$pkgname-$pkgver-beta"
  go build -ldflags="-s -w" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver-beta"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}
