# Contributor: Eduardo Reveles <me at osiux dot ws>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-class-gomor
pkgver=1.03
pkgrel=1
pkgdesc="another class and object builder"
_dist=Class-Gomor
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/G/GO/GOMOR/$_dist-$pkgver.tar.gz")
md5sums=('701c0d407574cd5bb1c52537a63ac276')
sha512sums=('b5447df8a8ef5d6c28ffedb6effaf8e2723f347acec244b6251254d1a0651039b7ebb44d7171c3437ae48810342471bd7dbda4b9c3ea2a2030075ef9de106920')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)