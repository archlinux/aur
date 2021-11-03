# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-CompactTree
pkgname=perl-xml-compacttree
pkgver=0.03
pkgrel=3
pkgdesc="Builder of compact tree structures from XML documents"
arch=("any")
url="https://metacpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://cpan.metacpan.org/authors/id/P/PA/PAJAS/$_perlmod-$pkgver.tar.gz)
sha256sums=('87faace2f1bfa17bd8afbe6a2794aa881b1d921a93f3f8e3519a879c2e910300')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}
