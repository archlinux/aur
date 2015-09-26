# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-xsd'
pkgver=0.005
pkgrel=1
pkgdesc='type constraints based on XML schema datatypes'
_dist='Types-XSD'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-types-xsd-lite>=0.004' 'perl-type-tiny>=0.004' 'perl-xml-regexp>=0' 'perl-datetimex-auto>=0.004' 'perl-datetime-incomplete>=0')
checkdepends=('perl-type-tiny>=0.004' 'perl-test-simple>=0.96')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('72a9be0095ec6544c746f4a67a164df8f94f9828666bd7daf110d32637a07c49')

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
