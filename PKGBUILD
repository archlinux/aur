# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=minaxnt-bin
pkgver=0.13.2
pkgrel=1
pkgdesc="MinAXNT is a Go implementation of the Axentro mining protocol"
arch=("x86_64")
url="https://github.com/Axentro/minaxnt"
license=("Apache License 2.0")
provides=("minaxnt")
conflicts=("minaxnt" "minaxnt-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/minaxnt_${pkgver}_linux_x86_64.tar.gz")
sha256sums=("4c66309eb321855ab2e0e4b067ce5f9a06337a809d7c9955132e4d0bd2807775")

package() {
  mkdir -p "$pkgdir/opt/minaxnt"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/minaxnt" "$pkgdir/opt/minaxnt/minaxnt"
  ln -s "/opt/minaxnt/minaxnt" "$pkgdir/usr/bin/minaxnt"

  chmod +x "$pkgdir/opt/minaxnt"
}
