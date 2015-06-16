# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-xml'
pkgver='0.08'
pkgrel='1'
pkgdesc="Compare XML in perl tests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.34' 'perl-xml-semanticdiff>=0.95')
makedepends=()
url='http://search.cpan.org/dist/Test-XML'
source=('http://search.cpan.org/CPAN/authors/id/S/SE/SEMANTICO/Test-XML-0.08.tar.gz')
md5sums=('490b487e07908358eb64a3c3c5b48143')
sha512sums=('04b6a2180de258c5059442050b3292d7edcbca910f2a3b7b8332f3a64a9d26ae8a7f0eec176b9da3f1b6e984e0c6de533fe61e7a9aa13e07ecaea478405d8eb6')
_distdir="Test-XML-0.08"

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
