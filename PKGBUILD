# Maintainer: erroneous at gmail
# https://aka.ms/install-azd.sh

pkgname=azure-dev-cli-bin
_pkgname=azure-dev-cli
pkgver=1.10.0
pkgrel=1
pkgdesc="A developer-centric command-line interface tool for creating Azure applications."
arch=('x86_64')
url="https://github.com/Azure/azure-dev"
license=('MIT')
depends=('glibc')
conflicts=("azure-dev-cli")
provides=("azure-dev-cli")
_architecture="amd64"
source=("$_pkgname-$pkgver-$CARCH.tar.gz::https://github.com/Azure/azure-dev/releases/download/${_pkgname}_${pkgver}/azd-linux-${_architecture}.tar.gz")
sha256sums=('5f74313b7f096f32b8fda590971ea38d42f629978a4a13811dbb0e365c66a372')
options=(!strip)

package() {
  mkdir -p "$pkgdir/opt/microsoft" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/azd-linux-${_architecture}" "$pkgdir/opt/microsoft/azd"
  ln -s "/opt/microsoft/azd" "$pkgdir/usr/bin/azd"
  install -Dm644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
}
