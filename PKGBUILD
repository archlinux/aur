# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-cgi-expand'
pkgver='2.04'
pkgrel='1'
pkgdesc="convert flat hash to nested data using TT2's dot convention"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/CGI-Expand'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOWMANBS/CGI-Expand-2.04.tar.gz')
md5sums=('5825c759e43dac82e082568d1c8f6158')
sha512sums=('fa921d0a4d7be5f2fed448bd4af767bdbb01067d268890d9d39644f39ec41aee3ce95e8642f98d41d4ec5cab10fb6d2a73e48004ccd32e972550b1b90dcdffe4')
_distdir="CGI-Expand-2.04"

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
