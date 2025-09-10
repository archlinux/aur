# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple Bitwarden RBW frontend for Fuzzel"
arch=('x86_64')
url="https://github.com/sammhansen/fuzzel-rbw"
license=('MIT')
depends=()
makedepends=()
source=("$url/releases/download/v$pkgver/frbw"
        "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('e0462139c932c578a9cd3a6ee5a0a352a83483c93227248ae1c24400b4b15591'
            'b3c2254fbc2d65f6ee209e0d0d1b30eb1879f5b3e3d1f972ef6dee67d0220db4')

package() {
  # Install the binary
  install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"

  # Install the assets from the source tarball
  install -d "$pkgdir/usr/share/fuzzel-rbw/assets"
  cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/"* \
        "$pkgdir/usr/share/fuzzel-rbw/assets/"
}

