# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-treepp-xmlpath'
pkgver='0.72'
pkgrel='1'
pkgdesc="Similar to XPath, defines a path as an accessor to nodes of an XML::TreePP parsed XML Document."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-treepp')
makedepends=()
url='http://search.cpan.org/dist/XML-TreePP-XMLPath'
source=('http://search.cpan.org/CPAN/authors/id/R/RG/RGLAUE/XML-TreePP-XMLPath-0.72.tgz')
md5sums=('SKIP')
_distdir="XML-TreePP-XMLPath-0.72"

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

