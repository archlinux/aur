# Maintainer: robertfoster

pkgname=libshout-idjc
pkgver=2.4.5
pkgrel=1
pkgdesc="Libshout library plus some extensions for IDJC."
arch=('i686' 'x86_64')
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'openssl')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/project/libshoutidjc.idjc.p/${pkgname}-${pkgver}.tar.gz")
license=('LGPL')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('2b48bb9cf71182ac6683448e097c1ec4')
