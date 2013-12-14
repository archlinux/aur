# Maintainer: mutantmonkey <aur@mutantmonkey.in>
_author=MASAKI
_perlmod=MouseX-Types-Path-Class
pkgname=perl-mousex-types-path-class
pkgver=0.07
pkgrel=1
pkgdesc="A Path::Class type library for Mouse"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-mousex-types')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MA/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('228d4b4f3f0ed9547278691d0b7c5fe53d90874a69df709a49703c6af87c09de')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
