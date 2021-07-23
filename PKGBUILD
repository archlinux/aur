# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_perlmod="Class-ErrorHandler"
_modnamespace=Class
pkgname=perl-class-errorhandler
pkgver=0.04
pkgrel=3
pkgdesc="Base class for error handling"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008_001')
makedepends=('perl-module-build')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('9e235da1c2091f9422723af4528305b8ed2b50920a865e6fee76380a8c512fcd837d752f4ea5146df12c506c776e88c1075419ab3809be3296995387df759c83')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
