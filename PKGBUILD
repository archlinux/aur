# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-vcard'
pkgver='0.010'
pkgrel='1'
pkgdesc="convert between RDF and vCard"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-namespace-clean' 'perl-rdf-trine>=0.135' 'perl-rdf-trinex-functions' 'perl-text-vfile-asdata>=0.07' 'perl-uri' 'perl-xml-libxml>=1.70')
makedepends=()
url='http://search.cpan.org/dist/RDF-vCard'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/RDF-vCard-0.010.tar.gz')
md5sums=('909ebc142784dbd51ab77d2ec84e09a9')
sha512sums=('a6529fca3096a141e8b40977e0224a014046f7a46f947b52a2411f03cbe6a570f9c3618c9043bc397600e8533f471fb9b1a7ba849d361fe4460645a3319fc284')
_distdir="RDF-vCard-0.010"

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
