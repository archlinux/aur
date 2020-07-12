# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-html5-entities'
pkgver='0.004'
pkgrel='2'
pkgdesc="drop-in replacement for HTML::Entities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://search.cpan.org/dist/HTML-HTML5-Entities'
source=("https://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-HTML5-Entities-${pkgver}.tar.gz")
sha512sums=('5c6b868bf90377d6516bc12bd5be93833abc418a9fd3f83065d0f3c42fb28ee4e9dc28553e4397a7f4e5a5354e37654c299beaf639fccb07b948b1ccc4919512')
_distdir="HTML-HTML5-Entities-${pkgver}"

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
