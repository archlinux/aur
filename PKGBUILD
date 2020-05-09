# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-uri-imaps'
pkgver='1.03'
pkgrel='1'
pkgdesc="Support IMAPS URI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='http://search.cpan.org/dist/URI-imaps'
source=("https://cpan.metacpan.org/authors/id/A/AL/ALEXM/URI-imaps-${pkgver}.tar.gz")
sha512sums=('0d0be3c132e458eba1add00eced4f4f5968fdc62861fe4c8b610465e1fc2949b83c4c32bebbc6199b06b3465ab696fb25132769c26d5dacbdae4ae58bd3d4c26')
_distdir="URI-imaps-${pkgver}"

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
