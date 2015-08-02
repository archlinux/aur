# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-html-selector-xpath'
pkgver='0.18'
pkgrel='1'
pkgdesc="CSS Selector to XPath compiler"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-base>=0')
url='http://search.cpan.org/dist/HTML-Selector-XPath'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORION/HTML-Selector-XPath-0.18.tar.gz')
md5sums=('bb46fc14bb6ea3169a6176db00cc68f6')
sha512sums=('bb51d8daaa80a5563934ee5caab885de69b07ed8a5862c9956613ff152ecec33fa2d40ee1adab37714a56c77aea69fb1db62734809c2e3016c0a5acc207b6578')
_distdir="HTML-Selector-XPath-0.18"

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
