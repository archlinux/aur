# Maintainer: Kuro <kurojs@github>
# Contributor: Kuro <kurojs@github>

pkgname=kurolaunch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI generator for scaffolding Minecraft Helios Launcher projects"
arch=('x86_64')
url="https://github.com/kiroku67/kurolaunch"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kiroku67/kurolaunch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96c08db0a43e8485c1e028c8f27702af5f9b2453ace34747d968d69656ce8840')

build() {
  cd "$srcdir/kurolaunch-$pkgver"
  go build -ldflags="-s -w -X main.version=$pkgver" -o kurolaunch ./cmd/kurolaunch
}

package() {
  cd "$srcdir/kurolaunch-$pkgver"
  install -Dm755 kurolaunch "$pkgdir/usr/bin/kurolaunch"
}
