# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.18.2
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
cksums=('2134579891')
sha256sums=('ba0afe584bf45567fc8156773554a2365b85c0ffbbdc322bfeda6f8c18674029')
b2sums=('d19abf3aeab9adf4bff3dabbfcc4498bab84e7d41a0d3b662aa701c63e663c06ea3a2fd6658a6b68e619aed69293c14300dcf5a3e77225ec76f2d0168f48cf43')

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/bin
  make install PREFIX="${pkgdir}/usr"
}
