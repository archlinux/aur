# Maintainer: Alexander Phinikarides, <alexisph _AT_ gmail _DOT_ com>

pkgname=iouyap
pkgver=0.97
pkgrel=2
pkgdesc='Bridge IOU to UDP, TAP and Ethernet. GNS3 tool.'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/iouyap'
license=('GPL3')
groups=('gns3')
# makedepends=('iniparser')
depends=('bison'
        'flex'
        'iniparser')
optdepends=()
md5sums=('d874e11fd32c3348c1d5f92d60274f72')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
