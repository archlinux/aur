# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-CompactTree
pkgname=perl-xml-compacttree
pkgver=0.03
pkgrel=2
pkgdesc="Builder of compact tree structures from XML documents"
arch=("any")
url="http://search.cpan.org/~pajas/$_perlmod/"
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
source=(http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/$_perlmod-$pkgver.tar.gz)
md5sums=('f69c3390578f3e70b4f664a6bcfe9f7e')

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
