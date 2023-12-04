# Maintainer: erroneous at gmail
# https://aka.ms/install-azd.sh

pkgname=azure-dev-cli-bin
_pkgname=azure-dev-cli
pkgver=1.5.0
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
sha256sums=("b50c96afd2491d189f4f7d82379aa372d2aa743a12d691c7aabc845463d8fd75")
options=(!strip)

package() {
  mkdir -p "$pkgdir/opt/microsoft" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 "$srcdir/azd-linux-${_architecture}" "$pkgdir/opt/microsoft/azd"
  ln -s "/opt/microsoft/azd" "$pkgdir/usr/bin/azd"
  install -Dm644 "$srcdir/NOTICE.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICE.txt"
}
