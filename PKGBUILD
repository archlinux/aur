# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=perl-bencode
pkgver=1.502
pkgrel=2
pkgdesc='BitTorrent serialisation format'
arch=('any')
url='https://search.cpan.org/dist/Bencode'
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=()
checkdepends=('perl-exporter-tidy' 'perl-test-differences')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/A/AR/ARISTOTLE/Bencode-$pkgver.tar.gz)
sha512sums=('076ef6dabc8453488cd733f5ae82bd102690c4591784abd955c37cc8f0515ab513423a486d25022cdea2b52919894ac26e4b2580dd67a3c977fd96fc4eebe5b7')

build() {
  cd Bencode-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Bencode-$pkgver
  make test
}

package() {
  cd Bencode-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
