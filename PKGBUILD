# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=Tk-CodeText
pkgname=perl-tk-codetext
pkgver=0.3.4
pkgrel=4
pkgdesc="Tk-CodeText perl module (a TextUndo widget with syntax highlighting capabilities)"
arch=("any")
url="http://search.cpan.org/~hanje/Tk-CodeText/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-tk' 'perl-syntax-highlight-perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/H/HA/HANJE/$_perlmod-$pkgver.tar.gz)
md5sums=('321bda6595d122f22f4392dfce24d378')

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
