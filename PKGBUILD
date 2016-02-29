# CPAN Name  : XML-NamespaceFactory
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-namespacefactory'
pkgver='1.02'
pkgrel='1'
pkgdesc="Simple factory objects for SAX namespaced names."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/XML-NamespaceFactory'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceFactory-1.02.tar.gz')
md5sums=('38917352898dc8fdbe9243b11113d416')
sha512sums=('c9fe4fc8f34034373bf205962940c45f7f01c8763e8aaea37af5c1e3d7d1aab4520c7d35f3d521e4209acc12eb3427d727dba3399f1978cc6ba02271b9e35482')
_distdir="XML-NamespaceFactory-1.02"

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
