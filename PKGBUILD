# Maintainer: M0Rf30

pkgname=libshout-idjc
pkgver=2.4.1
pkgrel=1
pkgdesc="Libshout-idjc is libshout plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/idjc/${pkgname}/${pkgname}-${pkgver}.tar.gz")
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

md5sums=('206bdb6018440f4a24b81039fce48bee')
