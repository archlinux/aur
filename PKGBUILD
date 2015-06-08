# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-libxml-debugging'
pkgver='0.102'
pkgrel='1'
pkgdesc="get debugging information from XML::LibXML nodes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-html-html5-entities' 'perl-xml-libxml')
makedepends=()
url='http://search.cpan.org/dist/XML-LibXML-Debugging'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/XML-LibXML-Debugging-0.102.tar.gz')
md5sums=('8afe6c029af6591dfc05b0631ba353f2')
sha512sums=('5b6f94f30cb0f5289e1e7d01b2d3467dc71759b55f6578eafef29c8f94eda31a92b97e8853aa8127cc22e91439e63a48bab31cd9a582b3072884fdee5b3f1744')
_distdir="XML-LibXML-Debugging-0.102"

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
