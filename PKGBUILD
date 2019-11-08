# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-test-harness
pkgver=3.42
pkgrel=1
pkgdesc='Run Perl standard test scripts with statistics'
_dist=Test-Harness
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="$pkgdir"
}

sha256sums=('0fd90d4efea82d6e262e6933759e85d27cbcfa4091b14bf4042ae20bab528e53')
