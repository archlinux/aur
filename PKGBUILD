# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.13.10
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
optdepends_x86_64=(intel-ipsec-mb)
source=("https://github.com/ColinIanKing/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('972b429f9eb0afbceabf7f3babab8599d8224b5d146e244c2cfe65129befb973')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
