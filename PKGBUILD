# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=besu
pkgver=26.7.1
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11' 'jemalloc')
replaces=('pantheon')
#changelog=
source=("https://github.com/hyperledger/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7311ba20a585a016543a12417d2c822e850c6a6fc58e5128cdf770653951f6c7')

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
