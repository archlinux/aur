# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.16
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
cksums=('3262774792')
sha256sums=('ccb5974a9574f0ce361f8d2d68f743957a44c9e27dc9490589e8f91c9f8f6bb6')
b2sums=('ddfbfe95803a686b5122f8d4de111a729723be434b3ab1efa427b5505355534e6cdc264a93a061ba6456e007e5bf65c5473a1bd964a5ad27185441dec8f3fce3')

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/bin
  make install PREFIX="${pkgdir}/usr"
}
