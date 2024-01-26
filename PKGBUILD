# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=besu
pkgver=24.1.1
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11' 'jemalloc')
replaces=('pantheon')
#changelog=
source=("https://hyperledger.jfrog.io/artifactory/$pkgname-binaries/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4b0ddd5a25be2df5d2324bff935785eb63e4e3a5f421614ea690bacb5b9cb344')

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
