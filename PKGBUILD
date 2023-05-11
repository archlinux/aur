pkgname=ton
pkgver=v2023.04
pkgrel=1
pkgdesc="The Open Network"
arch=('x86_64')
url="https://github.com/ton-blockchain/ton"
license=('LGPL2')
depends=(
  'pacman>5'
)
source=("${pkgname}.tar.gz::https://github.com/neodiX42/rpm-repo/releases/latest/download/ton-linux-x86-64.tar.gz")
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
