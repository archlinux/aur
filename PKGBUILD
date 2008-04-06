# $Id: PKGBUILD,v 1.1 2007/03/11 09:02:44 tpowa Exp $
# Mantainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=libofa
pkgver=0.9.3
pkgrel=1
pkgdesc="Open Fingerprint Architecture"
arch=(i686 x64_86)
url="http://www.musicdns.org/"
depends=('expat' 'curl' 'fftw')
makedepends=(pkgconfig)
options=(NOLIBTOOL)
source=(http://www.musicip.com/dns/files/$pkgname-$pkgver.tar.gz
	gcc-4.patch)


build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../gcc-4.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

