# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-xsd-lite'
pkgver=0.005
pkgrel=1
pkgdesc='type constraints based on a subset of XML schema datatypes'
_dist='Types-XSD-Lite'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-type-tiny>=0.004')
checkdepends=('perl-test-simple>=0.96' 'perl-test-fatal>=0' 'perl-test-requires>=0' 'perl-type-tiny>=0.004')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('a2e4490f730a437650c088c0cc9310d9ddecb7ff519b6623262675249aa0e566')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
