# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-prefixes'
pkgver='0.004'
pkgrel='1'
pkgdesc="simple way to turn URIs into QNames"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/RDF-Prefixes'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-Prefixes-0.004.tar.gz')
md5sums=('aa4a083e2afe98f0df7b93de0342fd27')
sha512sums=('cb244e62062a9083546763df59e13aee6331021acd0e5e8751ec954508e690d39a80bd47097595dee0d7fa11b2da52cb8d12f0a87a5c0e345c35209a6a0bb1f5')
_distdir="RDF-Prefixes-0.004"

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
