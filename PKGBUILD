# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.14
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
sha256sums=('af9c2323367b5a583a72cfda196c77719ae6f198ae9c6ed8fae32942dc6356b1')

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/bin
  make install PREFIX="${pkgdir}/usr"
}
