# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-Filter-DOMFilter-LibXML
pkgname=perl-xml-filter-domfilter-libxml
pkgver=0.04
pkgrel=1
pkgdesc="XML-Filter-DOMFilter-LibXML perl module (SAX filter allowing DOM processing of selected subtrees)"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-xml-libxml' 'perl-xml-sax-writer')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOROBA/$_perlmod-$pkgver.tar.gz)
md5sums=('af0c89ee03e196e15334dd8a1ba218b1')

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
