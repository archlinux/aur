pkgname=ton-bin
pkgver=2024.02
pkgrel=1
pkgdesc="Ultra-scalable blockchain, designed by Telegram to onboard billions of users."
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/ton-blockchain/packages/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('7e2ea0b164e3bd821e5554353a1a62a790896de04b16050b9c6bf1762d680dcf')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/{bin,lib/fift,share/ton}
  cp -a bin/* ${pkgdir}/usr/bin/
  cp -ar share/* ${pkgdir}/usr/share/
  cp -ar lib/* ${pkgdir}/usr/lib/
}
