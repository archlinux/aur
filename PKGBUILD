# CPAN Name  : Plack::Test::ExternalServer
# Submitter  : gergan_penkov
# Maintainer : gergan_penkov

pkgname=perl-plack-test-externalserver
pkgver=0.01
pkgrel=1
pkgdesc="Plack::Test::ExternalServer - Run HTTP tests on external live servers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-test-simple' 'perl-plack' 'perl-libwww')
url='http://search.cpan.org/~flora/Plack-Test-ExternalServer-0.01/lib/Plack/Test/ExternalServer.pm'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Plack-Test-ExternalServer-0.01.tar.gz')
md5sums=('bb0806b4e5bc61064e3736991dd8640c')

build() {
  cd "$srcdir/Plack-Test-ExternalServer-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Plack-Test-ExternalServer-$pkgver"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Plack-Test-ExternalServer-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
