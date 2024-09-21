# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=perl-exporter-tidy
pkgver=0.09
pkgrel=1
pkgdesc='Another way of exporting symbols'
arch=('any')
url='https://search.cpan.org/dist/Exporter-Tidy'
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl')
makedepends=()
checkdepends=()
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/J/JU/JUERD/Exporter-Tidy-$pkgver.tar.gz)
sha512sums=('d111ca36621601af7f210ef51ead24c3efbb64f0b09eb2daa8ed743de16dfb5e8a231250d7d073a3afcc5a96e732109f18369e47cc88470c88c3b2caad04fb93')

build() {
  cd Exporter-Tidy-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Exporter-Tidy-$pkgver
  make test
}

package() {
  cd Exporter-Tidy-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
