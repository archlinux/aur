# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 15/12/2011

_author=E/ED/EDAVIS
_perlmod=Sort-Versions
pkgname=perl-sort-versions
pkgver=1.5
pkgrel=2
pkgdesc='Sort::Versions - a perl 5 module for sorting of revision-like numbers'
arch=('any')
url="http://search.cpan.org/~edavis/Sort-Versions/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

build(){
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('5434f948fdea6406851c77bebbd0ed19')
