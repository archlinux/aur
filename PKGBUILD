# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>

pkgname=perl-term-shellui
pkgver=0.92
pkgrel=3
pkgdesc="A fully-featured shell-like command line environment "
arch=('any')
url="http://search.cpan.org/~BRONSON/Term-ShellUI"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/B/BR/BRONSON/Term-ShellUI-$pkgver.tar.gz) 
sha256sums=('3279c01c76227335eeff09032a40f4b02b285151b3576c04cacd15be05942bdb')

build() {
  cd  $srcdir/Term-ShellUI-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make 
}

package() {
  cd $srcdir/Term-ShellUI-$pkgver
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
