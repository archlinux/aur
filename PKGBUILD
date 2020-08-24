# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

# This package was made because the author of nushell-bin never update theirs

pkgname=nushell-latest-bin
pkgver=0.18.1
_suffix="${pkgver//./_}"
_basename="nu_${_suffix}_linux"
pkgrel=1
depends=(
  'zlib'
  'libxcb'
  'openssl'
  'libgit2'
)
optdepends=('libx11: for binaryview plugin')
arch=('x86_64')
pkgdesc='A new type of shell'
provides=('nushell')
conflicts=('nushell' 'nushell-bin')
source=(
  "https://github.com/nushell/nushell/releases/download/$pkgver/$_basename.tar.gz"
)
url="http://nushell.sh"
license=('MIT')
sha256sums=('SKIP')

package() {
  cd "$_basename/nushell-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
  install -Dm755 nu "$pkgdir/usr/bin/nu"
  cp nu_plugin_* "$pkgdir/usr/bin/"
}
