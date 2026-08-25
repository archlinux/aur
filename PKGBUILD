# Maintainer: robertfoster

pkgname=libshout-idjc
pkgver=2.4.6.r2 # renovate: datasource=git-tags depName=https://git.code.sf.net/p/idjc/libshoutidjc/code
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

sha256sums=('28f99f6653a4850c840c5ec885ed2afbcd83a28cde1871d5abe19cdee3dcbb32')
