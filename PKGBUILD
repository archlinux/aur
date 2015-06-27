# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_perlmod=PML
pkgname=perl-pml
pkgver=0.4.1
pkgrel=2
pkgdesc="PML Markup Lanuage"
arch=("any")
url="http://search.cpan.org/~pjones/$_perlmod/"
license=("GPL" "PerlArtistic")
groups=()
depends=('perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/P/PJ/PJONES/$_perlmod-$pkgver.tar.gz)
md5sums=('f1ee993f8a08916413e96bdd5d71e0f3')

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
