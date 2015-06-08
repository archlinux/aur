# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-rdfa-parser'
pkgver='1.097'
pkgrel='1'
pkgdesc="flexible RDFa parser"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-common-sense' 'perl-data-uuid' 'perl-file-sharedir' 'perl-html-html5-parser' 'perl-html-html5-sanity' 'perl-libwww' 'perl-rdf-trine>=0.130' 'perl-uri' 'perl-xml-libxml>=1.66' 'perl-xml-regexp')
makedepends=('perl-http-message')
url='http://search.cpan.org/dist/RDF-RDFa-Parser'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-RDFa-Parser-1.097.tar.gz')
md5sums=('3a12177fe21d2230ca496e121005db27')
sha512sums=('844b512b467a2bf3a86cbc894ce52ac6b98ad70331654f5e0ce91c3ef851d59984e455d185f46fb3c1808d805f412861f87626db32e859c0980d0167050ccc8e')
_distdir="RDF-RDFa-Parser-1.097"

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
