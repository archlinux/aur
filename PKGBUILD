# CPAN Name  : autodie
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname=perl-autodie
pkgver=2.21
pkgrel=1
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='http://search.cpan.org/dist/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/P/PJ/PJF/autodie-2.21.tar.gz)
options=(!emptydirs)
md5sums=('144b6f8335e98ecbb14267ebd59f69b1')

build() {
  cd "$srcdir/autodie-2.21"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/autodie-2.21"
  make test
}

package() {
  cd "$srcdir/autodie-2.21"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
