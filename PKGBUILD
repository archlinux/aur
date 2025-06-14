# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=0.9.19
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
install="${pkgname}.install"
sha512sums=('b693a64569ba17fcb40f8a7894fcc205efba17fc3103150bb6f1d7a8a165505c88251e75f56d003f4c4337e97bffa57b5948156e42d01a2938b8d969a088ff32')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ubridge "${pkgdir}"/usr/bin/ubridge
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/ubridge/README.md
}

