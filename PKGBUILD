# Mantainer: M0Rf30
pkgname=libshout-idjc
pkgver=2.3.1
pkgrel=2
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LDFLAGS+=-lspeex
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

md5sums=('7b2cb89f1e7863522597b1e27fd4a2b7')
