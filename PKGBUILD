# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=teku
pkgver=23.6.1
pkgrel=1
pkgdesc="ConsenSys Ethereum Beacon Chain Client"
arch=('any')
url="https://docs.teku.consensys.net"
license=('Apache')
depends=('java-runtime>=11')
source=("https://artifacts.consensys.net/public/$pkgname/raw/names/$pkgname.tar.gz/versions/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4a33cf38265ba1b5eb5142eaad230d4b3aaf5130bfaf54d7d37cca9eac10d64c')

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
