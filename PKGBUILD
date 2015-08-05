# Maintainer: Sauliusl <luksaulius[at]gmail>
pkgname=perl-math-cdf
pkgver=0.1
pkgrel=1
pkgdesc="Generate probabilities and quantiles from several statistical probability functions"
url="http://search.cpan.org/~callahan/Math-CDF-0.1/CDF.pm"
arch=('x86_64' 'i686')
license=('GPL' 'PerlArtistic')
depends=('perl')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("http://search.cpan.org/CPAN/authors/id/C/CA/CALLAHAN/Math-CDF-0.1.tar.gz")
sha1sums=('b0c027f9ebf5fca55c7acac8e1c832eae83c9263')


build() {
	cd ${srcdir}/Math-CDF-${pkgver}/
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	perl Makefile.PL PERL_AUTOINSTALL=--skipdeps
	make
}

check() (
  cd ${srcdir}/Math-CDF-${pkgver}/
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)


package() {
  cd ${srcdir}/Math-CDF-${pkgver}/
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et: