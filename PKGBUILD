# Maintainer: Sam Hansen <samhansen.dev@gmail.com>
pkgname=fuzzel-rbw
pkgver=0.1.2
pkgrel=3
pkgdesc="A simple Bitwarden RBW frontend for Fuzzel"
arch=('x86_64')
url="https://github.com/sammhansen/fuzzel-rbw"
license=('MIT')
depends=()
makedepends=()
source=("$url/releases/download/v$pkgver/frbw"
        "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('6c49f0bc765269b616e4a2f0d10fa4349acbf1d8ea62fa0c8241ee530aaaeaf6'
            '4d183685b496d7e413e73ba507d4e8ea9a1fc4b8d981e007c5264162da419c4a')

package() {
  # Install the binary
  install -Dm755 "$srcdir/frbw" "$pkgdir/usr/bin/frbw"
  install -Dm755 "$srcdir/pinentry-fuzzel" "$pkgdir/usr/bin/pinentry-fuzzel"

  # Install the assets from the source tarball
  install -d "$pkgdir/usr/share/pixmaps"
  cp -r "$srcdir/fuzzel-rbw-$pkgver/.assets/bitwarden.png" \
        "$pkgdir/usr/share/pixmaps/"
}
