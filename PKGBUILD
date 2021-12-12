# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.13.08
pkgrel=2
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
optdepends_x86_64=(intel-ipsec-mb)
source=("https://github.com/ColinIanKing/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('5dbb886f3926ef6c88e18cfd83c750f9fc11fb658f83b6eafcf22fd3a456cc8f')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
