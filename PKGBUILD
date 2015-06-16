# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-css'
pkgver='1.09'
pkgrel='1'
pkgdesc="Object oriented access to Cascading Style Sheets (CSS)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-parse-recdescent>=1')
makedepends=()
url='http://search.cpan.org/dist/CSS'
source=('http://search.cpan.org/CPAN/authors/id/I/IA/IAMCAL/CSS-1.09.tar.gz')
md5sums=('4b86ec12e673e545a5801f40ac1c5e48')
sha512sums=('3169d7b56be09c847d36ae1f58bf5b1aefd191535941836e7ece103c1ab229d8847c3ab0a6422f51aeaa9e28c3a1983cc96a3c3bd60dd1f0b33a848bfb2c2df1')
_distdir="CSS-1.09"

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
