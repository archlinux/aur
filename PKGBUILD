# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-type-tie'
pkgver=0.009
pkgrel=1
pkgdesc='tie a variable to a type constraint'
_dist='Type-Tie'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8.5' 'perl-exporter-tiny>=0.026')
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0' 'perl-test-simple>=0.96')
makedepends=()
provides=("perl-type-tie-hash=$pkgver" "perl-type-tie-array=$pkgver" "perl-type-tie-scalar=$pkgver" "perl-type-tie-base=$pkgver" "perl-type-tie-hash=$pkgver" "perl-type-tie-array=$pkgver" "perl-type-tie-scalar=$pkgver" "perl-type-tie-base=$pkgver" "perl-type-tie-hash=$pkgver" "perl-type-tie-array=$pkgver" "perl-type-tie-scalar=$pkgver" "perl-type-tie-base=$pkgver" "perl-type-tie-hash=$pkgver" "perl-type-tie-array=$pkgver" "perl-type-tie-scalar=$pkgver" "perl-type-tie-base=$pkgver" "perl-type-tie-hash=$pkgver" "perl-type-tie-array=$pkgver" "perl-type-tie-scalar=$pkgver" "perl-type-tie-base=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('565d9ec0a7f93095d5e68a8794a25c0b27e292007e04fdb77793f477da1463f3')

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
