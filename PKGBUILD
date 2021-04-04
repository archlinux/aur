# Maintainer: Filip Weiss <minepkg+me@fiws.net>

pkgname=minepkg
pkgver=0.0.59
pkgrel=1
pkgdesc="Manage Minecraft mods with ease."
arch=('x86_64')
url="https://github.com/minepkg/minepkg"
license=('MIT')
groups=()
depends=()
makedepends=('go')
optdepends=()
source=("https://github.com/fiws/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('399742cfd0ad2fabd579ff5404bdfb27e397b4d335e694ba1291620cb8b189b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -ldflags="-s -w -X main.version=$pkgver -X main.disableSelfupdate=yes" -o ./out/minepkg main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "out/minepkg" "$pkgdir/usr/bin/minepkg"
}
