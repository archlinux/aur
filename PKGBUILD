# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uuid-tiny'
pkgver='1.03'
pkgrel='1'
pkgdesc="Pure Perl UUID Support With Functional Interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1')
makedepends=()
url='http://search.cpan.org/dist/UUID-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/C/CA/CAUGUSTIN/UUID-Tiny-1.03.tar.gz')
md5sums=('5120b9b90b4c986f82441d096112f3d7')
sha512sums=('30b1aabdc067316d868c06a8723bd1d0e022e991de40f351b61a1c0ed657cb4dc99d5467a02b780c0749915cc30021cc4fc60c44b889bccd958a3a8e745cd491')
_distdir="UUID-Tiny-1.03"

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
