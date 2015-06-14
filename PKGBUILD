# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-Experimento
pkgname=perl-padre-plugin-experimento
pkgver=0.02
pkgrel=2
pkgdesc='Padre::Plugin::Experimento - Provides experimental features to Padre'
arch=('any')
url="http://search.cpan.org/~azawawi/Padre-Plugin-Experimento"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
perl-io-string
perl-wx-scintilla
perl-modern-perl
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
md5sums=('594216e7a337bf9e20667b1503a23e0c')
