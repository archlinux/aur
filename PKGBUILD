# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.1
pkgrel=2
pkgdesc="A simple Bitwarden RBW frontend for Fuzzel"
arch=('x86_64')
url="https://github.com/sammhansen/fuzzel-rbw"
license=('MIT')
depends=()
makedepends=()
source=("$url/releases/download/v$pkgver/frbw"
        "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('878477ec924a1cc9fa3f7f6de6a1be3ec317c513b972fd7aedacf5504618a12f'
            '7dc33652b3f4f75f55399d205243febe98b8748fcb0a60a544cf5f77c04a6022')

package() {
  # Install the binary
  install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"

  # Install the assets from the source tarball
  install -d "$pkgdir/usr/share/pixmaps"
  cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
        "$pkgdir/usr/share/pixmaps/"
}
