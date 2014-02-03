# Maintainer: Caleb Maclennan <caleb@alerque.com>
_author=rclamp
_perlmod=Net-Rendezvous-Publish
pkgname=perl-net-rendezvous-publish
pkgver=0.04
pkgrel=2
pkgdesc="Net::Rendezvous::Publish - publish Rendezvous services"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod/lib/Net/Rendezvous/Publish.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/$_perlmod-$pkgver.tar.gz)
md5sums=(abd07bd91853f5536d6e3434c67918c3)

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
