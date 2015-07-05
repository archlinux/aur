# Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Pizon <pizon@pizon.org>

pkgname=perl-geo-ipfree
pkgver=1.141670
pkgrel=1
pkgdesc="Look up country of IP Address. This module make this off-line and the DB of IPs is free & small."
arch=('any')
url="http://search.cpan.org/~bricas/Geo-IPfree"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/Geo-IPfree-$pkgver.tar.gz) 
sha256sums=('7b67b200e0af839e6a7784ea309975d1c7ebf68fae56d5d7160193e2f360a772')

build() {
  cd "$srcdir/Geo-IPfree-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Geo-IPfree-$pkgver"
  make install DESTDIR="$pkgdir/"
  find "$pkgdir/" -name '.packlist' -delete
  find "$pkgdir/" -name '*.pod' -delete
}
