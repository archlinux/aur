# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cddb-file'
pkgver='1.05'
pkgrel='1'
pkgdesc="Parse a CDDB/freedb data file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/CDDB-File'
source=('http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/CDDB-File-1.05.tar.gz')
md5sums=('c619e60e86a2bb227d434066c742b189')
sha512sums=('569294e1b8e26b905915cc4c97dd1fd55d223a662deaba22258a452a5a0fb79e07ec8b0175715a34ad6d6ec3ecce794e04c7e17dd4ee8db22535ef75ef6d09fa')
_distdir="CDDB-File-1.05"

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
