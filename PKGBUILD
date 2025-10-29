# Maintainer: Mylloon <aur@mylloon.fr>

# shellcheck disable=SC2034,SC2154

pkgname='sonosano'
pkgver=0.3.2
pkgrel=1
pkgdesc="P2P Song Player"
arch=('x86_64')
url=https://github.com/KRSHH/Sonosano
license=('Apache-2.0')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Sonosano_amd64.deb")
md5sums=('SKIP')

package() {
  cd "$srcdir" || exit

  install -d "$pkgdir/opt/Sonosano"
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/Sonosano/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
