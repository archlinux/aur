pkgname=ton-bin
pkgver=2024.01
pkgrel=1
pkgdesc="Ultra-scalable blockchain, designed by Telegram to onboard billions of users."
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/ton-blockchain/packages/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('e7982178870d4d7bfb53fad82ac5310372dcf2765ea759efa259b78b18fe57b9')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/local/{bin,lib/fift,share/ton}
  cp -a bin/* ${pkgdir}/usr/local/bin/
  cp -ar share/* ${pkgdir}/usr/local/share/
  cp -ar lib/* ${pkgdir}/usr/local/lib/
}
