# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=1.3.0
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha512sums=('bb054c83d79fd73a0812d8d52450040597fa1474d85f2da1ce2fb1148dba9aa76153e2175ebff37ea6fb4eed7f03f8d16e8ffbcfcc8b5bd584364c7a90904d77')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ubridge "${pkgdir}"/usr/bin/ubridge
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/ubridge/README.md
}

