# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=P/PD/PDEEGAN
_perlmod=XML-Mini
pkgname=perl-xml-mini
pkgver=1.38
pkgrel=2
pkgdesc='XML::Mini - Perl implementation of the XML::Mini XML create/parse interface'
arch=('any')
url="http://search.cpan.org/~pdeegan/XML-Mini/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl
)
makedepends=(
perl
)
optdepends=()
provides=(
perl-xml-mini-document
perl-xml-mini-element
perl-xml-mini-element-cdata
perl-xml-mini-element-comment
perl-xml-mini-element-doctype
perl-xml-mini-element-entity
perl-xml-mini-element-header
perl-xml-mini-node
perl-xml-mini-treecomponent 
)
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
md5sums=('0262295a6812f4ea1a4c13aefa9067c4')
