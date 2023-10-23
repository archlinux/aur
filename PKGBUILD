pkgname=ton-bin
pkgver=2023.10
pkgrel=1
pkgdesc="Ultra-scalable blockchain, designed by Telegram to onboard billions of users."
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/ton-blockchain/packages/releases/latest/download/ton-linux-x86-64.tar.gz")
sha256sums=('e149ec884188bd500d46ebd3c2394b8e67cfe346f9c749fa93072a266681e08b')

package() {
  cd "$srcdir"
  mkdir -p ${pkgdir}/usr/bin
  cp -a bin/* ${pkgdir}/usr/bin
  if [ -d lib ]; then
    mkdir -p ${pkgdir}/usr/lib
    cp -a lib/* ${pkgdir}/usr/lib;
  fi

  # Fix permissions
  chmod -R go-w "${pkgdir}"
}
