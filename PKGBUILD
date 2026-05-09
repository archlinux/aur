# Maintainer: Ben Word <ben@benword.com>
pkgname=quien-bin
_pkgname=quien
pkgver=0.9.0
pkgrel=1
pkgdesc="A better whois and domain intelligence toolkit (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('4d3fdbed6761e41b7c49e7da0297e2eb694d7be2b7b0c2ea0eaca00f946c7753')
sha256sums_aarch64=('ec59bbd2af32f1df467520ded12b1675ac446438dd3b1deb97eb2d4740bbf638')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
