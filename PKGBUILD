# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=H/HI/HINRIK
_perlmod=Perl6-Perldoc-To-Ansi
pkgname=perl-perl6-perldoc-to-ansi
pkgver=0.11
pkgrel=2
pkgdesc='Perl6::Perldoc::To::Ansi - ANSI-colored text renderer for Perl6::Perldoc'
arch=('any')
url="http://search.cpan.org/~hinrik/Perl6-Perldoc-To-Ansi/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-perl6-perldoc
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

md5sums=('da4ac20196daf242452d2da1ed404adc')
