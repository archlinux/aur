# Maintainer: Afri 5chdn <aur@cach.co>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=geth
pkgver=1.4.3
_commit="stable-dd083aa"
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
  '3a102d5939d3e80b4fcb4b1fe5ab6c2a2271a29a90248321bd7a1b72d7467106'
  '51c487d2bbb1b8307489720f6229c38f1217702f71a9debd82c8ec181570522c'
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
