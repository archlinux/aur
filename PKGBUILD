# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
_author=choroba
_perlmod=Treex-PML
pkgname=perl-treex-pml
pkgver=2.22
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
sha512sums=('78717aaf4ce4ffcea7245db14d5ab40cf0a317051b14c531ea1cd4fa6545dcb7e1f20b67248b67bf983d818eda5781a86b214fa08a5e2626ed14b575bf50e6f5')
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
