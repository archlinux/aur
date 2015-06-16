# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-io-interactive'
pkgver='0.0.6'
pkgrel='1'
pkgdesc="Utilities for interactive I/O"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IO-Interactive'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/IO-Interactive-0.0.6.tar.gz')
md5sums=('6ca9b8b8afc8b7d5e85985ea864d2431')
sha512sums=('beee3f3c9c6ad9c9ca34e313a36312a62520c98914c9c405beacee1c2b3bf05ad2b2fe5a53b43abff8dec1dcbccada4718dd8b7b31a98755d96a6ef0f9863863')
_distdir="IO-Interactive-0.0.6"

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
