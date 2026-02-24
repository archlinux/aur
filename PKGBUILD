pkgname=ton-bin
pkgver=2026.02.1
pkgrel=1
pkgdesc="Ultra-scalable blockchain, designed by Telegram to onboard billions of users."
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/ton-blockchain/packages/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('10dd2326a927d0301efd4e94e4cac7213982335e4327c473f68fdcf24fd53e53')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/{bin,lib/fift,share/ton}
  cp -a bin/* ${pkgdir}/usr/bin/
  cp -ar share/* ${pkgdir}/usr/share/
  cp -ar lib/* ${pkgdir}/usr/lib/
}
