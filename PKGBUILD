# Maintainer: vlensys (contact me on github for wtv reason) hi
pkgname=lyricspot
pkgver=2.0.0
pkgrel=1
pkgdesc="Live synced lyrics in your terminal"
arch=('any')
url="https://github.com/vlensys/lyricspot"
license=('GPL3')
depends=('python' 'playerctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vlensys/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a0e700f088d0e01d91a3dfca1974440405a7eb3351a5f31503328a86a74cc62e')

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 lyricspot.py "$pkgdir/usr/lib/lyricspot/lyricspot.py"


  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/lyricspot" <<'LAUNCHER'
#!/bin/bash
exec python3 /usr/lib/lyricspot/lyricspot.py "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/lyricspot"
}
