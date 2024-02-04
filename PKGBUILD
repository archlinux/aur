# Maintainer: Kars Wang <jaklsy AT gmail.com>
# Contributor: Jiří Klimeš <blueowl@centrum.cz>

pkgname=perl-url-encode
pkgver=0.03
pkgrel=2
pkgdesc='Encoding and decoding of application/x-www-form-urlencoded encoding.'
_dist='URL-Encode'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.1' 'perl-carp>=0' 'perl-exporter>=0' 'perl-xsloader>=0' 'perl-module-install')
checkdepends=()
makedepends=('perl-test-simple>=0.88' 'perl-extutils-makemaker>=6.59')
provides=('perl-url-encode-pp=0.03')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/$_dist-$pkgver.tar.gz")
md5sums=('3501ba92bbd23bb230959a5c9a22ca12')
sha512sums=('1f47b9ca9470f0f51f4b3e806f32ef0044d10ab2723944ba93eb740278155fcb77471208b833f7d77ff829cc5879211f592a3ae6ba3ccd6a4ee38d866bb38197')
sha256sums=('7295d7f07796b179131d9c0f230a6effa56d204de2f8dc72f2e09c61458c8ee6')

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
