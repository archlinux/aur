# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=ubridge
pkgver=0.9.3
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
depends=('libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
md5sums=('e78a53a4a0d9301059c86fe5d67297fb')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 ${srcdir}/${pkgname}-${pkgver}/README.rst -t ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
