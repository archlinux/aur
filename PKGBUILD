# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}
pkgver=0.9.21
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
makedepends=('make')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jclehner/nmrpflash/archive/v${pkgver}.tar.gz")
cksums=('2042608864')
sha256sums=('0be3a8771087b592002258ce6f34729da7a76d81eff52ac95dee788c0f4fc9b3')
b2sums=('d58aff5a468e5d381b895bd51af976e97c87f9027a779edfbb888bf4468303c576e3c477466f3ac7d3ba5c0cc06437340d229a9bc375f007bbc1380ce3a52ea2')

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
