# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_author=choroba
_perlmod=Treex-PML
pkgname=perl-treex-pml
pkgver=2.17
pkgrel=1
pkgdesc="Perl implementation for the Prague Markup Language (PML)"
arch=("any")
url="http://search.cpan.org/~$_author/$_perlmod/"
license=("GPL" "PerlArtistic")
groups=()
depends=('perl' 'perl-xml-compacttree' 'perl-pml' 'perl-file-sharedir' 'perl-universal-does' 'perl-uri' 'perl-xml-libxml' 'perl-libwww' 'perl-xml-writer')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHOROBA/${_perlmod}-${pkgver}.tar.gz")
md5sums=('29299c2afe2c4cc8351242edf8fe86d0')
options=(!emptydirs)

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
