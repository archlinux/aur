# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=perl-exporter-tidy
pkgver=0.08
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
sha512sums=('3d218c845d95267baacc227b5c864e8cefeabb1d92ac39f86129495c6d9bb971ca1f924ca91f3998c51c95a535e1f0c39774174cb12c75771a23e3f16ed02816')

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
