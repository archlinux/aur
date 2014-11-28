# Contributor: Rorschach <r0rschach@lavabit.com
# Maintainer: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=afick
pkgver=2.14
_realpkgver=2.14-1
pkgrel=1
pkgdesc="Alternative to tripwire"
url="http://afick.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl' 'perl-tk')
source=(http://downloads.sourceforge.net/afick/afick-$_realpkgver.tgz)
md5sums=('74b85916767a45c024a4dc125547f6a2') 

build() {
  cd $srcdir/$pkgname-$_realpkgver
  perl Makefile.pl
  make || return 1
  make DESTDIR=$pkgdir/ install
  chmod a+r $pkgdir/etc/{afick.conf,cron.daily/afick_cron}
  chmod a+rx $pkgdir/{etc/logrotate.d,var/{log/afick,lib/afick,lib/afick/archive}}
}
