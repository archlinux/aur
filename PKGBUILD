# Maintainer: René Wagner
# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-modern-perl
pkgver=1.20250607
pkgrel=1
pkgdesc="enable all of the features of Modern Perl with one command"
arch=(any)
url="https://metacpan.org/release/Modern-Perl"
license=('GPL-1.0-only' 'Artistic-1.0')
depends=('perl>=5.10.0')
makedepends=('make')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/C/CH/CHROMATIC/Modern-Perl-$pkgver.tar.gz")

build() {
  cd "$srcdir/Modern-Perl-$pkgver"

  # for packages with Build.PL, do this instead:
  perl Makefile.PL installdirs=vendor destdir="$pkgdir/"
  make
}

package() {
  cd "$srcdir/Modern-Perl-$pkgver"
  
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
sha256sums=('38ed7eb7b91aeed153887483e49a9a807a2e8962ab227cc6fdb5ea4dc41df128')
