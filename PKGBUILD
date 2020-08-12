# Maintainer: Ratan Rai Sur <ratan.r.sur@gmail.com>
pkgname=besu
pkgver=1.5.2
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11')
replaces=('pantheon')
#changelog=
source=("$pkgname-$pkgver.tar.gz::https://bintray.com/hyperledger-org/$pkgname-repo/download_file?file_path=$pkgname-$pkgver.tar.gz")
sha256sums=('66a89851536e6d902522c86529ee7f7b796755c0815102825d08b6ddc33d35eb')

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
