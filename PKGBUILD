# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-PerlCritic
pkgname=perl-padre-plugin-perlcritic
pkgver=0.12
pkgrel=2
pkgdesc='Padre::Plugin::PerlCritic - Analyze perl files with Perl::Critic'
arch=('any')
url="http://search.cpan.org/~azawawi/Padre-Plugin-PerlCritic"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
perl-critic
)
makedepends=(perl)
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
package(){
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('a77ebe6f08cb314d1d3420b444c0ddf1')
