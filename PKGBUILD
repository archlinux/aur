# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-query'
pkgver='2.909'
pkgrel='1'
pkgdesc="A complete SPARQL 1.1 Query and Update implementation for use with RDF::Trine."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-uuid' 'perl-datetime-format-w3cdtf' 'perl-error' 'perl-json>=2' 'perl-parse-recdescent' 'perl-rdf-trine>=0.138' 'perl-set-scalar' 'perl-uri>=1.52')
makedepends=('perl-test-exception' 'perl-test-json' 'perl-yaml')
url='http://search.cpan.org/dist/RDF-Query'
source=('http://search.cpan.org/CPAN/authors/id/G/GW/GWILLIAMS/RDF-Query-2.909.tar.gz')
md5sums=('6f07ee7db42f42d399abf49e48edeed9')
sha512sums=('3f843cc9f700f46858f9f1bba8600fe9607eb1536cb2125ca73c9da325821857e5a6c4183398542ad871228c297c3eb7b9b8fd5a51e5ce8142cd1410529499d0')
_distdir="RDF-Query-2.909"

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
