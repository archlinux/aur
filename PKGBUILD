# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-html5-sanity'
pkgver='0.105'
pkgrel='1'
pkgdesc="make HTML5 DOM trees less insane"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-role-commons' 'perl-xml-libxml>=1.70')
makedepends=('perl-xml-libxml-debugging')
url='http://search.cpan.org/dist/HTML-HTML5-Sanity'
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-HTML5-Sanity-${pkgver}.tar.gz")
sha512sums=('e932fb107829a0bd196f7bece990fb28584719deb7ccb3b3b2d914646d7c7f0ae23ed8d45ffbec4c47a6bd2b89772deb2c186d031c5a07a7e184179fa13971a5')
_distdir="HTML-HTML5-Sanity-${pkgver}"

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
