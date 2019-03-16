# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>
pkgname=minivmac
pkgver=36.04
pkgrel=1
pkgdesc="a miniature early Macintosh emulator"
arch=('x86_64')
url="https://www.gryphel.com/c/minivmac/"
_url_d="https://www.gryphel.com/d/minivmac"
license=('GPL2')
depends=('libx11')
source=(${pkgname}-${pkgver}.tgz::"${_url_d}/${pkgname}-${pkgver}/$pkgname-$pkgver.src.tgz")
sha256sums=('9b7343cec87723177a203e69ad3baf20f49b4e8f03619e366c4bf2705167dfa4')
build() {
  cd ${pkgname}
  gcc setup/tool.c -o setup_t
  ./setup_t -t lx64 > setup.sh
  . setup.sh
  make
}
package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}" "$pkgdir"/usr/bin/$pkgname
}
