# Contributor: Trizen <trizenx@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-gmpz'
pkgver='0.42'
pkgrel='1'
pkgdesc="perl interface to the GMP library's integer (mpz) functions."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1' 'gmp>=6.1.0')
makedepends=()
url='https://metacpan.org/release/Math-GMPz'
source=("http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-GMPz-$pkgver.tar.gz")
md5sums=('49277732410fe27f99fe1cf1e652ac98')
sha512sums=('ee2eae4179b0f909849986ae818eeeb3835fdf2c8661d2311940578d325625111611d8c67050aeafc9deb13b7b55294f1c1ca5bbdab58b3cab43b3714c677855')
_distdir="Math-GMPz-$pkgver"

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
