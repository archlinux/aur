# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=S/SO/SOREAR
_perlmod=STD
pkgname=perl-std
pkgver=20101111
pkgrel=2
pkgdesc='The STD.pm6 command line multitool'
arch=('any')
url="http://search.cpan.org/~sorear/STD/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-moose
perl-yaml-libyaml
perl-file-sharedir
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
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

md5sums=('a8ebd8d331d14789cf39e58eeada85e4')
