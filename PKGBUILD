# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpz'
pkgver='0.41'
pkgrel='1'
pkgdesc="perl interface to the GMP library's integer (mpz) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPz'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-GMPz-0.41.tar.gz')
md5sums=('12f95fd62fc5a63ff06621578712300c')
sha512sums=('4c94971373c5e910a09c7183ce74d2acab402e1b5835c26369467b107d8a254e06f8ed5b85d1f86e69d645b950d05463c2c65fb77cb817c0e18377cba6ee4c71')
_distdir="Math-GMPz-0.41"

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
