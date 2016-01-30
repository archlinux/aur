# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=wjelement
pkgver=1.1
pkgrel=1
pkgdesc="JSON manipulation in C including reading, writing and validation"
arch=('i686' 'x86_64')
url="https://github.com/netmail-open/wjelement/wiki"
license=('LGPL')
depends=('bash' 'rlwrap')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netmail-open/wjelement/archive/v${pkgver}.tar.gz)
sha512sums=('b9c0214c0136e1cf188d0c6967c14f97632cb176f2d889019bc4932424d95bb6372e69951bada57fc8fe0b6c7997c74244d1e631a9ce2ad5833ddc1dcc462e74')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/doc"
}

