# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-encodings'
pkgver=0.002
pkgrel=1
pkgdesc='type constraints for Bytes and Chars'
_dist='Types-Encodings'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8.1' 'perl-type-tiny>=0.004')
checkdepends=('perl-type-tiny>=0' 'perl-test-simple>=0.96')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('56f60d55ce72f832cea20587fb329a303ef0be00da39b2c3c73a47429c21130f')

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
