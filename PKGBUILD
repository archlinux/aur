# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=D/DC/DCONWAY
_perlmod=Perl6-Perldoc
pkgname=perl-perl6-perldoc
pkgver=0.000009
pkgrel=1
pkgdesc='Perl6::Perldoc - Use Perl 6 documentation in a Perl 5 program'
arch=('any')
url="http://search.cpan.org/~dconway/Perl6-Perldoc/"
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
perl-perl6-perldoc-parser
perl-perl6-perldoc-to-text
perl-perl6-perldoc-to-xhtml 
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
md5sums=('2ad1abf8df325d2c5bd5b2b4d235676d')
