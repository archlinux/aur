# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xmahjongg
pkgver=3.7
pkgrel=9
pkgdesc="Mahjongg game for X-Window"
arch=('x86_64' 'i686')
url="http://www.lcdf.org/xmahjongg/"
license=('GPL')
depends=('gcc-libs' 'libx11')
source=(http://www.lcdf.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
	${pkgname}.desktop)
sha512sums=('eb952b38b2ea79f3037a6e8063042f4094e0719edd366c0327350aaf6484ee64ad5d174741bbb80fc49dba62eba4790ffc97eb1bf0d942149e614bde7bd1759a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  install -Dm0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
sha512sums=('eb952b38b2ea79f3037a6e8063042f4094e0719edd366c0327350aaf6484ee64ad5d174741bbb80fc49dba62eba4790ffc97eb1bf0d942149e614bde7bd1759a'
            'a78901abb5a84373b6ef34f9b9f5bd26037e65ea713892248547c21b153812caff135d63328204beb620b2ea6987717b4981437f15c01e3b5ff39b99655a5478')
