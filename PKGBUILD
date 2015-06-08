# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-commonns'
pkgver='0.06'
pkgrel='1'
pkgdesc="A list of commonly used namespaces"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-namespacefactory')
makedepends=()
url='http://search.cpan.org/dist/XML-CommonNS'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-CommonNS-0.06.tar.gz')
md5sums=('b1825e94c93a91f4d54502c434818fb7')
sha512sums=('9fb34bd9f36f85b4c7d2ccf677a8a6779ae2a78c81212013ffb787ee7ba31561620a26bab234758614d6de4e0971eb8a63efcfcff68a0aa9e175044d162ac3e0')
_distdir="XML-CommonNS-0.06"

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
