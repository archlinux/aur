# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: James An <james@jamesan.ca>
_perlmod=XML-XSH2
pkgname=xsh
pkgver=2.1.25
pkgrel=1
pkgdesc="XSH - XML editing shell"
arch=("any")
url="http://xsh.sourceforge.net/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-io-stringy' 'perl-term-readline' 'perl-parse-recdescent' 'perl-xml-libxslt' 'perl-xml-sax-writer' 'perl-xml-xupdate-libxml' 'perl-xml-filter-domfilter-libxml' 'perl-uri')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOROBA/$_perlmod-$pkgver.tar.gz)
md5sums=('98d4d1124f59c854a873ceb594cd816d')

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
