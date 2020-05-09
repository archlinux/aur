# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-prefixes'
pkgver='0.005'
pkgrel='1'
pkgdesc="simple way to turn URIs into QNames"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/RDF-Prefixes'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/RDF-Prefixes-${pkgver}.tar.gz")
sha512sums=('342dba44acbff26d20998cd6098bf1abe24c6875de18f0e45e8a6688f76ece1c61376c78a2ceb84acf9ab5d84bdf13166024f4748d36eee44421a860d3d54d04')
_distdir="RDF-Prefixes-${pkgver}"

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
