# Maintainer: Ramana Kumar <ramana@member.fsf.org>
pkgname=teku
pkgver=24.10.3
pkgrel=1
pkgdesc="ConsenSys Ethereum Beacon Chain Client"
arch=('any')
url="https://docs.teku.consensys.net"
license=('Apache')
depends=('java-runtime-headless>=21')
source=("https://artifacts.consensys.net/public/$pkgname/raw/names/$pkgname.tar.gz/versions/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ca9111ba2a47261b71892e1e5f50789211c7e5dfd1b612c6d7f0f5802f99d767')

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
