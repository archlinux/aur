# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cgi-emulate-psgi'
pkgver='0.15'
pkgrel='1'
pkgdesc="PSGI adapter for CGI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.0' 'perl-http-message')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/CGI-Emulate-PSGI'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/CGI-Emulate-PSGI-0.15.tar.gz')
md5sums=('3f0b6ae68d1e84e66ea8eb629e569284')
sha512sums=('0dd95fd4d7f208d713101533408e8faf6c97db039abf442e469d74a0f467624d833b9625d25f162929c5c1c23c8af0ee2b723287c1d4d13c6b9e0b2ba4abd4d8')
_distdir="CGI-Emulate-PSGI-0.15"

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
