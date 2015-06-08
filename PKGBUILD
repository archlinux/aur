# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-namespacefactory'
pkgver='1.00'
pkgrel='1'
pkgdesc="Simple factory objects for SAX namespaced names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/XML-NamespaceFactory'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceFactory-1.00.tar.gz')
md5sums=('7690c6c95ef3f26e5279f456ed6b3cf0')
sha512sums=('91371892136314d45749c31023ff1c9f19437d2508c33532ec6436968fbabeb42e75efb7bacc3c26503989368d1f5ed7e7e8b194fb3f157df5cd00b601020686')
_distdir="XML-NamespaceFactory-1.00"

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
