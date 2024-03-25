# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-currency'
pkgver='0.53'
pkgrel='1'
pkgdesc="Exact Currency Math with Formatting and Rounding"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-encode-locale>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-more-utf8>=0')
url='https://metacpan.org/release/Math-Currency'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSCHOUT/Math-Currency-0.53.tar.gz')
md5sums=('32c06da7d919ff1e28d25c136bea8b38')
sha512sums=('b8fd936427b34fc65470789f3db53a081f1cd06c5027fdae57e9a58d03983c699ae2ff7a4f4b3e7f11cf6e1a2eaa61092f368dda211c3cad05ef3f25b0736e1f')
_distdir="Math-Currency-0.53"

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
