# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=1.1.1
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha512sums=('56eebc354860569697167f773cd37478aa324b610a0f7ec378b0af66c57ecf2dd457674bad24c44884d0b1c3b3d557b055015a6bbf2bd47ef6b667ef8bf9fbe9')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ubridge "${pkgdir}"/usr/bin/ubridge
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/ubridge/README.md
}

