# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=1.2.1
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha512sums=('ee947db5129da2d08b2fe53322283c20838ce3b25e778125d419276b28cecad8cac859ec87613587960097f0bd10e7e439ebcdf43b90476a62496d7f0ed081b8')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ubridge "${pkgdir}"/usr/bin/ubridge
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/ubridge/README.md
}

