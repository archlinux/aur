# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-XUpdate-LibXML
pkgname=perl-xml-xupdate-libxml
pkgver=0.6.0
pkgrel=4
pkgdesc="XML-XUpdate-LibXML perl module (simple implementation of XUpdate format)"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-xml-libxml-iterator')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/$_perlmod-$pkgver.tar.gz)
md5sums=('feee3db4ab0a0520d9b1f17b50f74693')

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
