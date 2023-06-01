# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=besu
pkgver=23.4.1
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11' 'jemalloc')
replaces=('pantheon')
#changelog=
source=("https://hyperledger.jfrog.io/artifactory/$pkgname-binaries/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('49d3a7a069cae307497093d834f873ce7804a46dd59207d5e8321459532d318e')

check() {
  "$pkgname-$pkgver/bin/$pkgname" --version
}

package() {
  install -dD -m757 "$pkgdir/opt/$pkgname"
  install -dD -m755 "$pkgdir/usr/bin"
  cd "$pkgname-$pkgver"
  rm bin/$pkgname.bat
  cp -p -r * "$pkgdir/opt/$pkgname"
  ln -rs "$pkgdir/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
