# Contributor: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-mpfr'
pkgver='3.33'
pkgrel='1'
pkgdesc="perl interface to the MPFR (floating point) library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gmp>=6.1.1' 'mpfr>=3.1.4.p1')
makedepends=()
url='https://metacpan.org/release/Math-MPFR'
source=("http://search.cpan.org/CPAN/authors/id/S/SI/SISYPHUS/Math-MPFR-$pkgver.tar.gz")
md5sums=('7c361ea4ba45d63c004489dccb83c08e')
sha512sums=('535b31fb4bc71cb00da52536f35165af6d34ddfb2afccbaf6f16d9e3b89fdfdf61e30bacc291559257fcc0bcd94b2a9d33549f8da2e58565e02566b74d8fe1c2')
_distdir="Math-MPFR-$pkgver"

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
