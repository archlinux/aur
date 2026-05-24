# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Damien Lebond <damienlebond@onionmail.org>
pkgname=atomicwallet-bin
pkgver=2.101.7
pkgrel=2
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('Custom:atomicwallet')
depends=(npm)
options=('!debug')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
b2sums=('f518d66a0e25dfb2e79d323e550a8ca1efd32061c6ab5f6640062c21f696e36c5ddf1bf2e3b6d803b2bc73fe7399f7a2c3625fd692e1aba489128b89977448e4')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}
