# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-query-client'
pkgver='0.111'
pkgrel='1'
pkgdesc="get data from W3C SPARQL Protocol 1.0 servers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-http-message' 'perl-libwww' 'perl-namespace-clean>=0.20' 'perl-rdf-trine>=0.133' 'perl-role-commons' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/RDF-Query-Client'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-Query-Client-0.111.tar.gz')
md5sums=('cad016ecb1c1630e421c02b601a126b3')
sha512sums=('72cef3ff7eb2f33e7a057986d30929460cd9f9c6a0f5cf19b9323e195679e980c9425117c11040c55c4a99f5ee49baaaa7120a5f70b0fdd34851ef62a1e833da')
_distdir="RDF-Query-Client-0.111"

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
