# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-LibXML-Iterator
pkgname=perl-xml-libxml-iterator
pkgver=1.06
pkgrel=1
pkgdesc="XML-LibXML-Iterator perl module (XML::LibXML's tree iteration class)"
arch=("any")
url="https://metacpan.org/dist/XML-LibXML-Iterator"
license=("PerlArtistic")
depends=('perl' 'perl-xml-libxml' 'perl-xml-nodefilter')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/${_perlmod}-$pkgver.tar.gz)
sha256sums=('fd329a8ad2b0ec6328aee0bc15fc13f2e789ebe3b5e104a81f5a5b4f241d019d')

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
