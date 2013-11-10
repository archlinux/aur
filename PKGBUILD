# CPAN Name  : DBIx::DBSchema
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-dbix-dbschema
pkgver=0.43
pkgrel=1
pkgdesc='Perl modile providing database-independent schema objects'
arch=('any')
url='http://search.cpan.org/dist/DBIx-DBSchema'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dbi')
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/DBIx-DBSchema-0.43.tar.gz)
options=(!emptydirs)
md5sums=('85fae785eac4df96ae8d6ed7c2b957f1')

build() {
  cd DBIx-DBSchema-0.43
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd DBIx-DBSchema-0.43
  make test
}

package() {
  cd DBIx-DBSchema-0.43
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
