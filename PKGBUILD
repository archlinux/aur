# CPAN Name  : Tie-ToObject
# Contributor: Anonymous

pkgname='perl-tie-toobject'
pkgver='0.03'
pkgrel='2'
pkgdesc="Tie to an existing object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Tie-ToObject'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Tie-ToObject-0.03.tar.gz')
md5sums=('b4f434992c286d531f26893c78541456')
sha512sums=('b3d2060d35e943e9aae28159ec71c7a6f01f47aa2905f5a218fafda8b1eb9e9da52038471617effe9f513f882b02e59946ddddf522058221b9132970e78ec94f')

build() {
  cd "$srcdir/Tie-ToObject-0.03"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Tie-ToObject-0.03"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Tie-ToObject-0.03"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
