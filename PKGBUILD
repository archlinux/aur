# I just put this together in a hurry based on what I found in ABS, it's uggly I know /KH

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Perl_Package_Guidelines for more
# information on Perl packaging.

# Maintainer: K. Hampf <k.hampf@gmail.com>
# http://search.cpan.org/CPAN/authors/id/K/KA/KAWASAKI/XML-TreePP-0.43.tar.gz
_author=kawasaki
_authorpath=K/KA/KAWASAKI # this is uggly
_perlmod=XML-TreePP
pkgname=perl-xml-treepp
pkgver=0.43
pkgrel=2
pkgdesc="XML::TreePP module parses an XML document and expands it for a hash tree."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://cpan.perl.org/modules/by-authors/id/$_authorpath/$_perlmod-$pkgver.tar.gz)
md5sums=('f69693066e52591bf1142d3f4e6d37e5')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
