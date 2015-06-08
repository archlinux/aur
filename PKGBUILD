# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-array-shuffle'
pkgver='0.03'
pkgrel='1'
pkgdesc="fast shuffling of arrays in-place"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Array-Shuffle'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Array-Shuffle-0.03.tar.gz')
md5sums=('9a4cdf80bc513a73088ae7ce7922dc11')
sha512sums=('684cc589d8038d7e5bff433183b6900d2d8da23e2fab5094c080f71bef6d2c2a02682f8337d2a856100cd55b49733cccce3055e35e280454efb2cac813586c37')
_distdir="Array-Shuffle-0.03"

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
