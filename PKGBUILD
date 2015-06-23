# CPAN Name  : Term-ExtendedColor-Xresources
# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Magnus Woldrich <magnus@trapd00r.se>
 
pkgname='perl-term-extendedcolor-xresources'
pkgver="0.072"
pkgrel='1'
pkgdesc="Subclass to Term::ExtendedColor"
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Term-ExtendedColor-Xresources'
license=('PerlArtistic' 'GPL')
depends=('perl-term-readkey')
options=('!emptydirs')
 
source=(http://search.cpan.org/CPAN/authors/id/W/WO/WOLDRICH/Term-ExtendedColor-Xresources-$pkgver.tar.gz)
md5sums=('8cfc8be19d7f1500194b4a5d2caffda7')
 
package() {
  DIST_DIR="${srcdir}/Term-ExtendedColor-Xresources-${pkgver}"
 
  {
        cd "$DIST_DIR" &&
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;
 
}
