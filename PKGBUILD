# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-LibXML-Iterator
pkgname=perl-xml-libxml-iterator
pkgver=1.04
pkgrel=3
pkgdesc="XML-LibXML-Iterator perl module (XML::LibXML's tree iteration class)"
arch=("any")
url="http://search.cpan.org/dist/XML-LibXML-Iterator/"
license=("PerlArtistic")
depends=('perl' 'perl-xml-libxml' 'perl-xml-nodefilter')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHISH/${_perlmod}-$pkgver.tar.gz)
md5sums=('bcbf474656bd4e1a1939c2459ca91ac1')

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
