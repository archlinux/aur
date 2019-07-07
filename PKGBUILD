# Maintainer: Gabriel Laskar <gabriel at lse dot epita dot fr>
pkgname=star
pkgver=1.6
pkgrel=1
url="http://freecode.com/projects/star"
pkgdesc="A fast POSIX-compliant tape archiver"
license=('CDDL')
depends=('glibc' 'attr' 'acl' 'libcap')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/s-tar/${pkgname}-${pkgver}.tar.bz2")
md5sums=('caa1e4d18659743154822e8607fe3ae9')

build() {
  cd $srcdir/$pkgname-$pkgver/
  make GMAKE_NOWARN=true INS_BASE=$pkgdir/usr/ INS_RBASE=$pkgdir/
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make install GMAKE_NOWARN=true INS_BASE=$pkgdir/usr/ INS_RBASE=$pkgdir/
  rm -rf $pkgdir/etc
  rm -rf $pkgdir/usr/bin/gnutar
  rm -rf $pkgdir/usr/bin/mt
  rm -rf $pkgdir/usr/bin/scpio
  rm -rf $pkgdir/usr/bin/smt
  rm -rf $pkgdir/usr/bin/spax
  rm -rf $pkgdir/usr/bin/star_sym
  rm -rf $pkgdir/usr/bin/suntar
  rm -rf $pkgdir/usr/bin/tar
  rm -rf $pkgdir/usr/bin/tartest
  rm -rf $pkgdir/usr/bin/ustar
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/lib
  rm -rf $pkgdir/usr/sbin
  rm -rf $pkgdir/usr/share/doc/rmt
  rm -rf $pkgdir/usr/share/doc/star/testscripts
  rm -rf $pkgdir/usr/share/man/man1/gnutar.1*
  rm -rf $pkgdir/usr/share/man/man1/match.1*
  rm -rf $pkgdir/usr/share/man/man1/mt.1*
  rm -rf $pkgdir/usr/share/man/man1/rmt.1*
  rm -rf $pkgdir/usr/share/man/man1/scpio.1*
  rm -rf $pkgdir/usr/share/man/man1/smt.1*
  rm -rf $pkgdir/usr/share/man/man1/spax.1*
  rm -rf $pkgdir/usr/share/man/man1/suntar.1*
  rm -rf $pkgdir/usr/share/man/man1/tartest.1*
  rm -rf $pkgdir/usr/share/man/man3
  rm -rf $pkgdir/usr/share/man/man5/makefiles.5*
  rm -rf $pkgdir/usr/share/man/man5/makerules.5*
}

# vim:set ts=2 sw=2 et:
