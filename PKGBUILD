# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=besu
pkgver=24.6.0
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11' 'jemalloc')
replaces=('pantheon')
#changelog=
source=("https://github.com/hyperledger/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fa86e5c6873718cd568e3326151ce06957a5e7546b52df79a831ea9e39b857ab')

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
