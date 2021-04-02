# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.12.06
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
depends_x86_64=(intel-ipsec-mb)
source=("http://kernel.ubuntu.com/~cking/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('75eb340266b1bbae944d8f9281af978bd5bc2c8085df97a098d5500d6f177296')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
