# $Id: PKGBUILD,v 1.2 2007/03/16 21:11:46 tom Exp $
# Maintainer: Tom K <tomk@runbox.com>

pkgname=gnu-netcat
pkgver=0.7.1
pkgrel=2
pkgdesc="GNU rewrite of netcat, the network piping application"
depends=('glibc')
source=(http://dl.sourceforge.net/sourceforge/netcat/netcat-$pkgver.tar.bz2)
md5sums=('0a29eff1736ddb5effd0b1ec1f6fe0ef')
url="http://netcat.sourceforge.net/"
license="GPL"
replaces=('netcat')
provides=('netcat')
arch=(i686)

build() {
  cd $startdir/src/netcat-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
