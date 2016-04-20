# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.4.0
pkgrel=1
pkgdesc="The go-ethereum commandline client (geth cli)."
arch=('i686' 'x86_64')
depends=(
  'gmp'
  'leveldb'
  'readline'
)
optdepends=('mist: Graphical Ethereum wallet and DApps browser.')
conflicts=(
  'geth-git'
  'go-ethereum'
  'go-ethereum-git'
)
provides=('geth')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=(
  "${pkgname}-${pkgver}-32.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v1.4.0/geth-1.4.0-rc-8241fa5-linux-386.tar.bz2"
  "${pkgname}-${pkgver}-64.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v1.4.0/geth-1.4.0-rc-8241fa5-linux-amd64.tar.bz2"
  "LICENSE.txt::https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
)
sha256sums=(
  '6ef30e52de4201eb1a43b775d87e7b92e60e56b201e1fea57e9f83a0f7fa61fe'
  'b28293ac19e93f8b23568db6a65bede57099276b42306b5462c007e45a1c6bd0'
  '48e234e35cf83b4f2543b0fbafcf7d33843378cc1a829654d5fc23f4e1b1e581'
)

package() {

  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "$srcdir/geth-1.4.0-rc-8241fa5-linux-amd64" "$pkgdir/usr/bin/geth"
  else
    install -Dm755 "$srcdir/geth-1.4.0-rc-8241fa5-linux-386" "$pkgdir/usr/bin/geth"
  fi

  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
