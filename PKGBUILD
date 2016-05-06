# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.4.1
_commit="rc-4b9de75"
pkgrel=2
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
  "${pkgname}-${pkgver}-32.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v$pkgver/geth-$pkgver-$_commit-linux-386.tar.bz2"
  "${pkgname}-${pkgver}-64.tar.bz2::https://github.com/ethereum/go-ethereum/releases/download/v$pkgver/geth-$pkgver-$_commit-linux-amd64.tar.bz2"
  "LICENSE.txt::https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
)
sha256sums=(
  'c74a394d923cce3e6acd7e0a4a0c868d5ad4fcf4383fe77fe4a425af3f4c8d55'
  'f6c3a4574b971fe943ccf5ca92388b95781f7baf52cd7f98c7ffc4f96cf2c74c'
  '48e234e35cf83b4f2543b0fbafcf7d33843378cc1a829654d5fc23f4e1b1e581'
)

package() {

  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "$srcdir/geth-$pkgver-$_commit-linux-amd64" "$pkgdir/usr/bin/geth"
  else
    install -Dm755 "$srcdir/geth-$pkgver-$_commit-linux-386" "$pkgdir/usr/bin/geth"
  fi

  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
