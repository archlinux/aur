# CPAN Name  : Plack::Middleware::ReverseProxy
# Submitter  : gergan_penkov
# Maintainer : tohojo

_perlmod='Plack-Middleware-ReverseProxy'
_modnamespace=Plack
pkgname='perl-plack-middleware-reverseproxy'
pkgver='0.17'
pkgrel=1
pkgdesc="Plack::Middleware::ReverseProxy - Supports app to run as a reverse proxy backend"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-plack' 'perl-yaml' 'perl-test-base')
url='http://search.cpan.org/~miyagawa/Plack-Middleware-ReverseProxy/'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/$_perlmod-$pkgver.tar.gz")
sha256sums=('f9bdd9c40cc0b79ec583881925032409a926cc2747cbed09b2ff221c3cb64254')

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
