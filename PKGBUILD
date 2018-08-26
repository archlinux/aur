# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-io-interactive
pkgver=1.022
pkgrel=1
pkgdesc="Utilities for interactive I/O"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-Interactive'
source=("http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/IO-Interactive-$pkgver.tar.gz")
md5sums=('bd48bfaac706b5c4b848210872d9c9fa')
_distdir="IO-Interactive-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd $_distdir
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd $_distdir
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd $_distdir
  make install

  find "$pkgdir" '(' -name .packlist -o -name perllocal.pod ')' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
