# Maintainer: robertfoster

pkgname=libshout-idjc
pkgver=2.4.3
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
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}

md5sums=('b9709072c76f9cb6c490d7eb1a7f714f')
