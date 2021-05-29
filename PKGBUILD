# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=minaxnt-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="MinAXNT is a Go implementation of the Axentro mining protocol"
arch=("x86_64")
url="https://github.com/Axentro/minaxnt"
license=("Apache License 2.0")
provides=("minaxnt")
conflicts=("minaxnt" "minaxnt-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/minaxnt_${pkgver}_linux_x86_64.tar.gz")
sha256sums=("47049d8a19384a2bab4f5ed379e55b159daae59926395ee726602b5db10aa003")

package() {
  mkdir -p "$pkgdir/opt/minaxnt"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/minaxnt" "$pkgdir/opt/minaxnt/minaxnt"
  ln -s "/opt/minaxnt/minaxnt" "$pkgdir/usr/bin/minaxnt"

  chmod +x "$pkgdir/opt/minaxnt"
}
