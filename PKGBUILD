# CPAN Name  : autodie
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-autodie
pkgver=2.20
pkgrel=1
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='http://search.cpan.org/dist/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/P/PJ/PJF/autodie-2.20.tar.gz)
options=(!emptydirs)
md5sums=('9612b13dba42e0259bb8ae58264f8177')

build() {
  cd "$srcdir/autodie-2.20"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/autodie-2.20"
  make test
}

package() {
  cd "$srcdir/autodie-2.20"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
