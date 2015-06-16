# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-version-next'
pkgver='0.002'
pkgrel='1'
pkgdesc="increment module version numbers simply and correctly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter')
makedepends=('perl-test-exception>=0.29')
url='http://search.cpan.org/dist/Version-Next'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Version-Next-0.002.tar.gz')
md5sums=('abf120bdaa094c3c8fcf23bbb21e34e8')
sha512sums=('bdae25c0f47b469684616d6f0c3a92c4f622cb1b4e09b015aaf11e9895d9d5d958dd6884d3ce2a71ede9139242a8c05ab4f9c4f9cf5a500a9f5b745342213743')
_distdir="Version-Next-0.002"

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
