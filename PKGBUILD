# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.17
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
cksums=('4258436687')
sha256sums=('fd3193c8c3a10bc50eb01da655570fd7d4fa191f6f489d517f86a85a4fc14681')
b2sums=('8b0c7f490aa6843e98011f7b5b271012520abf4bfc27b428702ee86021d23591090e821550aae93a914b0269639f292e2d437dbc5e6c759b12c84a695030dd01')

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/bin
  make install PREFIX="${pkgdir}/usr"
}
