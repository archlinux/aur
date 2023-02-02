# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.19
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
cksums=('1910001940')
sha256sums=('cb0757d4d38b5061d8a71ccb853f117675d3de3ec4aaa4e9179f614bbbfac31d')
b2sums=('59ee3b16160ac8378e3d7591426db371e8ce32e47401563d9744926e1a60953a9c103065b31304b053a030e3c15fdda243d01ee9a959a196d663d641d0ed458d')

build() {
  cd "${_pkgname}-${pkgver}"

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm0755 "${pkgdir}"/usr/bin
  make install PREFIX="${pkgdir}/usr"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
