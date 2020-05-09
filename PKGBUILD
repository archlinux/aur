# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-libxml-debugging'
pkgver='0.103'
pkgrel='1'
pkgdesc="get debugging information from XML::LibXML nodes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-html-html5-entities' 'perl-xml-libxml')
makedepends=()
url='http://search.cpan.org/dist/XML-LibXML-Debugging'
source=("https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/XML-LibXML-Debugging-${pkgver}.tar.gz")
sha512sums=('a30617338e3e9ab87e59d6db1591c744dd456db690fc7331ba029e551511ed39af0204426018e6cab7551ad7c0e0e9ddac3ebae435c3b21db768350de487243a')
_distdir="XML-LibXML-Debugging-${pkgver}"

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
