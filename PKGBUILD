# Maintainer: erroneous at gmail
# https://aka.ms/install-azd.sh

pkgname=azure-dev-cli-bin
_pkgname=azure-dev-cli
pkgver=1.9.3
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
sha256sums=("9689f9d29c6cba548651dd0de31f939346e2df1509115f2918341911e339e85c")
options=(!strip)

package() {
  mkdir -p "$pkgdir/opt/microsoft" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/azd-linux-${_architecture}" "$pkgdir/opt/microsoft/azd"
  ln -s "/opt/microsoft/azd" "$pkgdir/usr/bin/azd"
  install -Dm644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
}
