# Contributor: François Charette <firmicus ατ gmx δοτ net>
# Maintainer: mutantmonkey <aur@mutantmonkey.mx>

pkgname=perl-term-shellui
pkgver=0.92
pkgrel=5
pkgdesc="A fully-featured shell-like command line environment "
arch=('any')
url="https://github.com/bronson/Term-ShellUI"
license=('MIT')
depends=('perl')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/B/BR/BRONSON/Term-ShellUI-$pkgver.tar.gz)
sha256sums=('3279c01c76227335eeff09032a40f4b02b285151b3576c04cacd15be05942bdb')

build() {
  cd $srcdir/Term-ShellUI-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/Term-ShellUI-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
