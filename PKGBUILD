# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.4.4
_commit="stable-94ad694"
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
  "${pkgname}-${pkgver}-32.tar.bz2::https://bintray.com/artifact/download/karalabe/ethereum/geth-$pkgver-$_commit-linux-386.tar.bz2"
  "${pkgname}-${pkgver}-64.tar.bz2::https://bintray.com/artifact/download/karalabe/ethereum/geth-$pkgver-$_commit-linux-amd64.tar.bz2"
  "LICENSE.txt::https://raw.githubusercontent.com/ethereum/go-ethereum/master/COPYING"
)
sha256sums=(
  '797f1e1941a5370b4f87f8bea19b6e00ae4bf80862408a3b7c5cf7717c26531b'
  '3c11427b6a74c485671c1171582729d700a8fdbc567d76c11b813024cef3b607'
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
