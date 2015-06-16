# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-zmq'
pkgver='1.06'
pkgrel='1'
pkgdesc="Perl-ish Interface libzmq "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-name' 'perl-zmq-constants' 'perl-zmq-libzmq3')
makedepends=()
url='http://search.mcpan.org/dist/ZMQ'
source=('http://search.mcpan.org/CPAN/authors/id/D/DM/DMAKI/ZMQ-1.06.tar.gz')
md5sums=('bb78a185d0d9e7ae0be02b115b0a7958')
sha512sums=('27a7e13c5bd5d7152a25a81a02b90bcd6bb23b54136629b5dfa0bdcadebe484bcd252709ae8c545329a3c5048d86a026edf706436867dd6a50bc90e1e2259449')
_distdir="ZMQ-1.06"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
