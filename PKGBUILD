# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-menu-tree'
pkgver='0.02'
pkgrel='1'
pkgdesc="Generate Catalyst application menus"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/CatalystX-Menu-Tree'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CONVERTER/CatalystX-Menu-Tree-0.02.tar.gz')
md5sums=('2eb58543ac89b40c8e1a7bd93d027b9c')
sha512sums=('4e8110ddf9fc24705e09c71d6d7ca1db91cd3bcbd7968ae034576811b938aa2c0cafac2367b95535285b54a752d22a66a3367232a9133cf3b6141b910b16f3d0')
_distdir="CatalystX-Menu-Tree-0.02"

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
