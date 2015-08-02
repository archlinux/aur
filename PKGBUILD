# CPAN Name  : Plack::Middleware::ReverseProxy
# Submitter  : gergan_penkov
# Maintainer : gergan_penkov

pkgname='perl-plack-middleware-reverseproxy'
pkgver='0.15'
pkgrel=1
pkgdesc="Plack::Middleware::ReverseProxy - Supports app to run as a reverse proxy backend"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-plack' 'perl-yaml' 'perl-test-base')
url='http://search.cpan.org/~miyagawa/Plack-Middleware-ReverseProxy/'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Plack-Middleware-ReverseProxy-$pkgver.tar.gz")
md5sums=('62cc91a27f9388f238ea070c230bb5d5')

build() {
  cd "$srcdir/Plack-Middleware-ReverseProxy-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Plack-Middleware-ReverseProxy-$pkgver"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Plack-Middleware-ReverseProxy-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
