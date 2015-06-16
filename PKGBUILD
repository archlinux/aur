# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-dom-lite'
pkgver='0.15'
pkgrel='1'
pkgdesc="Lite Pure Perl XML DOM Parser Kit "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/XML-DOM-Lite'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHUNDT/XML-DOM-Lite-0.15.tar.gz')
md5sums=('1748c70d2c9991340b80379e64e5d9c1')
sha512sums=('1b4a53e479ae6fd4a3ce8d5fad4d49b5e89cc70a4376d2bdfd10d5ca4ffe29d9f0749883539f8b6825e75b56715735fd91cf6a3bb9d9335c6682f3772bf4aa34')
_distdir="XML-DOM-Lite-0.15"

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
