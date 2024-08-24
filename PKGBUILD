# Maintainer: Zamhedonia <zamhedonia@gmx.de>
pkgname=paxs
pkgver=0.1
pkgrel=1
pkgdesc="A script for managing packages across Yay, Flatpak, and Snap"
arch=('any')
url="https://github.com/zamhedonia/paxs"
license=('GPL-3.0')
depends=('yay' 'flatpak' 'snapd')
source=("https://github.com/zamhedonia/paxs/archive/refs/tags/v${pkgver}.tar.gz"
        "paxs.1")
sha256sums=('8005d31c8d3d8fdab0141dc53ad8a6b63059da07f2cf66d6369e3d49021f74a2'
            '088c3a3d21b3c053917c6160e4964c3c9554cb59223f6a025ee13f60fb8ab93b')

package() {
  cd "$srcdir/paxs-${pkgver}"

  # Install the main script
  install -Dm755 paxs "$pkgdir/usr/bin/paxs"

  # Install the LICENSE file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the manual page
  install -Dm644 paxs.1 "$pkgdir/usr/share/man/man1/paxs.1"
}
