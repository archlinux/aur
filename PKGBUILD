# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=teku
pkgver=25.2.0
pkgrel=1
pkgdesc="ConsenSys Ethereum Beacon Chain Client"
arch=('any')
url="https://docs.teku.consensys.net"
license=('Apache')
depends=('java-runtime-headless>=21')
source=("https://artifacts.consensys.net/public/$pkgname/raw/names/$pkgname.tar.gz/versions/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('71c8c02a277162d178259b60ae7d7d44927256a3c035c7d448c0b823caec7b4e')

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
