pkgname=perl-plack-test-externalserver
pkgver=0.01
pkgrel=1
pkgdesc="Plack::Test::ExternalServer - Run HTTP tests on external live servers"
arch=('any')
url="http://search.cpan.org/~flora/Plack-Test-ExternalServer-0.01/lib/Plack/Test/ExternalServer.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-test-simple' 'perl-plack')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Plack-Test-ExternalServer-0.01.tar.gz)
md5sums=('bb0806b4e5bc61064e3736991dd8640c')

build() {
  cd  "$srcdir/Plack-Test-ExternalServer-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}