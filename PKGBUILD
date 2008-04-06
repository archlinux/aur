# $Id: PKGBUILD,v 1.4 2005/09/03 23:06:37 jgc Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>

pkgname=libsidplay
pkgver=1.36.59
pkgrel=2
pkgdesc="A library for playing SID music files."
# url="http://sidplay2.sourceforge.net/"
url="http://www.geocities.com/SiliconValley/Lakes/5147/sidplay/linux.html"
depends=('glibc' 'gcc')
pkgurl="http://www.geocities.com/SiliconValley/Lakes/5147/sidplay/packages"
source=($pkgurl/$pkgname-$pkgver.tgz)
md5sums=('37c51ba4bd57164b1b0bb7b43b9adece')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
