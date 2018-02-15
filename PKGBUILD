# Maintainer: Caleb Maclennan <caleb@alerque.com>

_author=chlige
_perlmod=Net-Bonjour
pkgname=perl-net-bonjour
pkgver=0.96
pkgrel=3
pkgdesc="Net::Bonjour - Module for DNS service discovery (Apple's Bonjour)"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod/lib/Net/Bonjour.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-net-dns')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHLIGE/$_perlmod-$pkgver.tar.gz)
sha256sums=('c38a1f3ab200b08208d0c3a02b23d30653dfc62c09c6a12561c6ea08a69b1f97')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
