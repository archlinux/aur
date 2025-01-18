# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jon Arnold <jonarnoldsemail@gmail.com>

pkgname=perl-cddb
pkgver=1.222
pkgrel=5
pkgdesc='A high-level interface to cddb protocol servers (freedb and CDDB)'
_dist=CDDB
arch=('any')
url="https://metacpan.org/release/CDDB/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-http-message' 'perl-mailtools' 'perl-libwww')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RC/RCAPUTO/$_dist-$pkgver.tar.gz")
md5sums=('09da67cfbc54fd40144c325e320a84ed')
sha512sums=('addd0f4f3fecab7d599eb7ead93828d6a9c74a779a344f190a629e666c95af47b5eea05f885564a90bfa1fa6c128dc3e60e510f295f6f35b3eae2d8939109d98')

build() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

# check() {
#   cd "$_dist-$pkgver"
#   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
#   export PERL_MM_USE_DEFAULT=1
#   make test
# }

package() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
