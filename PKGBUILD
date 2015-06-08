# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-html5-entities'
pkgver='0.003'
pkgrel='1'
pkgdesc="drop-in replacement for HTML::Entities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/HTML-HTML5-Entities'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-HTML5-Entities-0.003.tar.gz')
md5sums=('a3f45a137d18246a8c3ef8a6242b7ac1')
sha512sums=('73e7cbb022958ab7855de64d4e876347830c5044e18960307a4e1a5bcd4a309b50f01a41c5091acc1874280058598cfc99604203ed8414f4b12ec4771a3cc2d1')
_distdir="HTML-HTML5-Entities-0.003"

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
