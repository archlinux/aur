pkgname=ton
pkgver=0
pkgrel=2
pkgdesc="The Open Network"
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.zip::https://github.com/ton-blockchain/ton/releases/latest/download/ton-linux-x86_64.zip")
sha256sums=('SKIP')

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
