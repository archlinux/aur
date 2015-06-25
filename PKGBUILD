# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-crypt-xtea'
pkgver=0.0106
pkgrel=1
pkgdesc='Implementation of the eXtended Tiny Encryption Algorithm'
_dist='Crypt-XTEA'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.10.1' 'perl-scalar-util-numeric>=0.40' 'perl-scalar-list-utils>=1.38' 'perl-carp>=1.3301')
checkdepends=('perl>=5.10.1')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JAHIY/$_dist-$pkgver.tar.gz")
sha256sums=('077caffaff8742e5234530451b203e6b0cd609d1903998f2eabf906c75361b95')

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
