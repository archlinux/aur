# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-moosex-arrayref'
pkgver='0.004'
pkgrel='1'
pkgdesc="blessed arrayrefs with Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-moose>=2.00')
makedepends=()
url='http://search.cpan.org/dist/MooseX-ArrayRef'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/MooseX-ArrayRef-0.004.tar.gz')
md5sums=('94ac5d40acb1fc6992c70616bfead7b5')
sha512sums=('1a9458f2461fef9eca374797b8166efcc49b5a2d3e84143f8d6870021fcebf969a49266ea0f411137c50a14631b2dbe5331c1e06e960f1d4ed9f45e73ddca4c8')
_distdir="MooseX-ArrayRef-0.004"

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
