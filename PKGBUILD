# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.3.5
pkgrel=1
pkgdesc="The go-ethereum commandline client (geth cli)."
arch=('x86_64')
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
  "${pkgname}-${pkgver}.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v1.3.5/geth-Linux64-20160303152500-1.3.5-34b622a.tar.bz2"
  "LICENSE.txt::https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
)
sha256sums=(
  '14d30a96c38d8a4d67cf48a66cadd8af534db170e354d27ac227b1fd057d2b24'
  '48e234e35cf83b4f2543b0fbafcf7d33843378cc1a829654d5fc23f4e1b1e581'
)

package() {
  install -Dm755 "$srcdir/geth" "$pkgdir/usr/bin/geth"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
