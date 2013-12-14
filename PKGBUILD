# Maintainer: mutantmonkey <aur@mutantmonkey.in>
_author=GFUJI
_perlmod=MouseX-Getopt
pkgname=perl-mousex-getopt
pkgver=0.34
pkgrel=1
pkgdesc="Organize your Mouse types in libraries"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GF/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('a1acee93e1fcf438fbf847aeffd98fd0197009c8ffda13b412c77106c9cbe4ea')

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
