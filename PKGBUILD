# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-trinex-functions'
pkgver='0.004'
pkgrel='1'
pkgdesc="some shortcut functions for RDF::Trine's object-oriented interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-perlx-maybe' 'perl-rdf-ns' 'perl-rdf-trine>=0.135' 'perl-scalar-does' 'perl-sub-exporter' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/RDF-TrineX-Functions'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-TrineX-Functions-0.004.tar.gz')
md5sums=('3ddbb1d6c296e40dd146826aa195a5a8')
sha512sums=('3c064be2be4090ae6560fbb973beb8ece497ff9d7dc25920436e4dbd5365fc16382e5764108d172d4aaa69c028ebbda4212246476938492fbb63c74b4de85c3a')
_distdir="RDF-TrineX-Functions-0.004"

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
