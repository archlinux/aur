# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=H/HI/HINRIK
_perlmod=Perl6-Doc
pkgname=perl-perl6-doc
pkgver=0.47
pkgrel=2
pkgdesc='Perl6::Doc - Perl 6 documentation'
arch=('any')
url="http://search.cpan.org/~hinrik/Perl6-Doc/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl
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

md5sums=('ae8574d17a95e612692bf092ad515b9c')
