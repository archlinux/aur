# $Id: PKGBUILD,v 1.4 2009/03/29 20:11:38 BaSh Exp $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=mp3info
pkgver=0.8.5a
pkgrel=2
pkgdesc="An MP3 technical info viewer and ID3 1.x tag editor"
arch=('i686' 'x86_64')
url="http://ibiblio.org/mp3info/"
license=('GPL')
depends=('ncurses' 'gtk2' )
source=(http://ibiblio.org/pub/linux/apps/sound/mp3-utils/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('cb7b619a10a40aaac2113b87bb2b2ea2')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  sed -i "s:-O2:${CFLAGS}:" Makefile
  sed -i "s:/usr/bin/install:/bin/install:" Makefile 
  
  make || return 1

  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/man/man1
  make prefix=${pkgdir}/usr mandir=${pkgdir}/usr/share/man/man1 install
}
