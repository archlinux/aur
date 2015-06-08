# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-rdfa-generator'
pkgver='0.103'
pkgrel='1'
pkgdesc="generate some data in RDFa"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-icon-famfamfam-silk' 'perl-rdf-prefixes' 'perl-rdf-trine>=0.112' 'perl-xml-libxml>=1.60')
makedepends=()
url='http://search.cpan.org/dist/RDF-RDFa-Generator'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-RDFa-Generator-0.103.tar.gz')
md5sums=('73aa7f161568fdaebf78d00c304482dd')
sha512sums=('270ffd01f03b89d731676aad7644322f163e96e679dd41ca0b69821cab55f3c3c20a8787a66f25fc1df8253a972ec9adc5d12f664f1c04fe91a9f4315ef4a20e')
_distdir="RDF-RDFa-Generator-0.103"

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
