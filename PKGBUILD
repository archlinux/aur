# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Contributor: mutantmonkey <mutantmonkey@gmail.com>

pkgname=perl-term-shellui
pkgver=0.92
pkgrel=2
pkgdesc="A fully-featured shell-like command line environment "
arch=('any')
url="http://search.cpan.org/~BRONSON/Term-ShellUI"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/B/BR/BRONSON/Term-ShellUI-$pkgver.tar.gz) 
sha256sums=('3279c01c76227335eeff09032a40f4b02b285151b3576c04cacd15be05942bdb')

build() {
  cd  $startdir/src/Term-ShellUI-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}
