# Maintainer: Ratan Rai Sur <ratan.r.sur@gmail.com>
pkgname=besu
pkgver=1.4.6
pkgrel=1
pkgdesc="Hyperledger Ethereum Mainnet and Permissioned Network Client"
arch=('any')
url="https://www.hyperledger.org/use/besu"
license=('Apache')
depends=('java-runtime>=11')
replaces=('pantheon')
#changelog=
source=("$pkgname-$pkgver.tar.gz::https://bintray.com/hyperledger-org/$pkgname-repo/download_file?file_path=$pkgname-$pkgver.tar.gz")
sha256sums=('7ac824a86f6a7bb704eda97b2a8597f48056895485c53eb057636035089d6030')

check() {
  "$pkgname-$pkgver/bin/$pkgname" --version
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d -Dm644 lib/ "$pkgdir/usr/share/besu/lib"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
