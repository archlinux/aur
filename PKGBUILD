# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=G/GS/GSULLIVAN
_perlmod=YAPE-Regex-Explain
pkgname=perl-yape-regex-explain
pkgver=4.01
pkgrel=2
pkgdesc='YAPE::Regex::Explain - explanation of a regular expression'
arch=('any')
url="http://search.cpan.org/~gsullivan/YAPE-Regex-Explain/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-yape-regex
)
makedepends=(
perl
)
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
md5sums=('8da1f721e79ef85f7e8bbc931309f493')
