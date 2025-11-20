# Maintainer: nixval <nicovaliantoku@gmail.com>

pkgname=declarch-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="A declarative package manager for Arch Linux (Binary Release)"
arch=('x86_64')
url="https://github.com/nixval/declarch"
license=('MIT')

depends=('pacman' 'git')
optdepends=(
  'paru: Recommended AUR helper'
  'yay: Alternative AUR helper'
  'flatpak: For managing Flatpak applications'
)

provides=('declarch')
conflicts=('declarch')

source=("declarch-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/declarch-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('2ab2388afedfa7268b5f5622630fdb83bb2ed47bd9230545b164817d709d1e6b')

package() {
  install -Dm755 "declarch" "$pkgdir/usr/bin/declarch"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/declarch/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
