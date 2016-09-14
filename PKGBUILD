# Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Pizon <pizon@pizon.org>

pkgname=perl-geo-ipfree
pkgver=1.151940
pkgrel=1
pkgdesc="Look up country of IP Address. This module make this off-line and the DB of IPs is free & small."
arch=('any')
url="http://search.cpan.org/~bricas/Geo-IPfree"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/Geo-IPfree-$pkgver.tar.gz) 
sha256sums=('ae8d67f4f7e999ee0190ca112045e207ef019fe5eda8b634ef2479f34d8f6251')

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
