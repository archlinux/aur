# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=XML-NodeFilter
pkgname=perl-xml-nodefilter
pkgver=0.01
pkgrel=4
pkgdesc="XML-NodeFilter perl module (generic XML::NodeFilter class)"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHISH/$_perlmod-$pkgver.tar.gz)
md5sums=('a585cd03435fc51ead427aa2c82b40a3')

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
