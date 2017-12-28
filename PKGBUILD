# Maintainer: robertfoster

pkgname=libshout-idjc
pkgver=2.4.2
pkgrel=1
pkgdesc="Libshout library plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'openssl' 'twolame')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/project/libshoutidjc.idjc.p/${pkgname}-${pkgver}.tar.gz")
license=('LGPL')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LDFLAGS+=-lspeex
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" uninstall-m4dataDATA
}
md5sums=('0e25d128e00aca44fbb3f4130b8ae50e')
