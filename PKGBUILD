# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xmahjongg
pkgver=3.7
pkgrel=8
pkgdesc="Mahjongg game for X-Window"
arch=('x86_64' 'i686')
url="http://www.lcdf.org/xmahjongg/"
license=('GPL')
depends=('gcc-libs' 'libx11')
source=(http://www.lcdf.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('eb952b38b2ea79f3037a6e8063042f4094e0719edd366c0327350aaf6484ee64ad5d174741bbb80fc49dba62eba4790ffc97eb1bf0d942149e614bde7bd1759a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
