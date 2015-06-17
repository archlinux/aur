# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-Filter-DOMFilter-LibXML
pkgname=perl-xml-filter-domfilter-libxml
pkgver=0.02
pkgrel=6
pkgdesc="XML-Filter-DOMFilter-LibXML perl module (SAX filter allowing DOM processing of selected subtrees)"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-xml-libxml')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/$_perlmod-$pkgver.tar.gz)
md5sums=('9089d02fbd5ff914070af4c3b9142f02')

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
