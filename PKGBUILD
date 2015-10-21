# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-mockmodule'
pkgver='0.05'
pkgrel='1'
pkgdesc="Override subroutines in a module for unit testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Test-MockModule'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMONFLK/Test-MockModule-0.05.tar.gz')
md5sums=('1b013aeeb221f83e7f325a2f98169296')
sha512sums=('8cbd2461dd0d9e9107c48a98be615c10dd77401569065a14cec555cc92f22c7211e7a7fb40149bd98c624bb1da838aa7be22a01391e2b6a70e7e58ec8af24da7')
_distdir="Test-MockModule-0.05"

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
