# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=ubridge
pkgname=${_pkgname}-git
pkgver=0.9.14
pkgrel=1
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
arch=('i686' 'x86_64')
url="https://github.com/GNS3/${_pkgname}"
license=('GPL3')
groups=('gns3')
depends=('libpcap')
makedepends=('gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/GNS3/${_pkgname}/archive/v${pkgver}.tar.gz")
install="${_pkgname}.install"
sha256sums=('d28538f15c02e7b889872a7478400855d5b9d9d26b0bdad621a0cc89395a3bc2')

build() {
  cd $srcdir/${_pkgname}-$pkgver
  make
}

package() {
  install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -m644 ${srcdir}/${_pkgname}-${pkgver}/README.rst -t ${pkgdir}/usr/share/doc/${_pkgname}
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
