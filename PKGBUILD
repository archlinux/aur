# Maintainer: Ratan Rai Sur <ratan.r.sur@gmail.com>
pkgname=besu
pkgver=1.5.0
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11')
replaces=('pantheon')
#changelog=
source=("$pkgname-$pkgver.tar.gz::https://bintray.com/hyperledger-org/$pkgname-repo/download_file?file_path=$pkgname-$pkgver.tar.gz")
sha256sums=('902bcd5003d080096c90ddda7d01d067e86effc44bceeb7a944950af201c8670')

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
