pkgname=ton-bin
pkgver=2023.11
pkgrel=1
pkgdesc="Ultra-scalable blockchain, designed by Telegram to onboard billions of users."
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/ton-blockchain/packages/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('60a0c1666cd7ca6f204cbbd5f9a603eebf7be3cac73362a1e8a853531b0d98ff')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/{bin,lib/fift,share/ton}
  cp -a bin/* ${pkgdir}/usr/bin/
  cp -ar share/* ${pkgdir}/usr/share/
  cp -ar lib/* ${pkgdir}/usr/lib/
  # Fix permissions
  chmod -R go-w "${pkgdir}"
}
