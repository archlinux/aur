# Maintainer: robertfoster

pkgname=libshout-idjc
pkgver=2.4.6.r1
pkgrel=1
pkgdesc="Library for accessing a shoutcast/icecast server (with IDJC customizations)"
arch=('i686' 'x86_64')
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'openssl')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/project/libshoutidjc.idjc.p/${pkgname}-${pkgver/.r/-r}.tar.gz")
license=('LGPL')

build() {
  cd "${srcdir}/${pkgname}-${pkgver%%.r*}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver%%.r*}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('7594ffc5e1d435014125d7dffb15a3450bba15d480a413c49aeaa5605050e1a1')
