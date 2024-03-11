# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=teku
pkgver=24.3.0
pkgrel=1
pkgdesc="ConsenSys Ethereum Beacon Chain Client"
arch=('any')
url="https://docs.teku.consensys.net"
license=('Apache')
depends=('java-runtime-headless>=11')
source=("https://artifacts.consensys.net/public/$pkgname/raw/names/$pkgname.tar.gz/versions/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8400bcae29ceb98f206471fdd44de42bf22a6eb8ba41a2d04e4e99d07c32c629')

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
