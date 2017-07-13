# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=0.9.11
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('4057224ff1173e0ac5dfbe69170b4fa71106db976cd0db617405ef272cf8ed3e')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ubridge "${pkgdir}"/usr/bin/ubridge
  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/ubridge/README.rst
}

