# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=besu
pkgver=24.3.0
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11' 'jemalloc')
replaces=('pantheon')
#changelog=
source=("https://github.com/hyperledger/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8037ce51bb5bb396d29717a812ea7ff577b0d6aa341d67d1e5b77cbc55b15f84')

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
