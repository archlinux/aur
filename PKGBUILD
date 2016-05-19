# Maintainer: M0Rf30

pkgname=libshout-idjc
pkgver=2.4.1
pkgrel=2
pkgdesc="Libshout library plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/idjc/${pkgname}/${pkgname}-${pkgver}.tar.gz")
provides=('libshout')
conflicts=('libshout')
license=('LGPL')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LDFLAGS+=-lspeex
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  
}

md5sums=('8c29d5a17207489c9d61a8b501774af4')
