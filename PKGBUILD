# Maintainer: Jonne Haß <me@mrzyx.de>
_author="dhorne"
_perlmod="CGI-Application-Plugin-RequireSSL"
pkgname=perl-cgi-application-plugin-requiressl
pkgver=0.04
pkgrel=1
pkgdesc="CGI::Application::Plugin::RequireSSL - Force SSL in specified pages or modules"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('unknown')
depends=('perl>=5.10.0' 'perl-cgi-application')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/D/DH/DHORNE/$_perlmod-$pkgver.tar.gz)
md5sums=('ffa4fbe3014ded658dc796aafc01a5f8')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
