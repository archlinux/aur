# CPAN Name  : DBIx::DBSchema
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-dbix-dbschema
pkgver=0.40
pkgrel=1
pkgdesc="Perl modile providing database-independent schema objects"
arch=("any")
url="http://search.cpan.org/dist/DBIx-DBSchema"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-dbi" "perl-freezethaw")
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/DBIx-DBSchema-0.40.tar.gz)
options=(!emptydirs)
md5sums=("2b4be96f6c8301b811c3e6edd35c1aa9")

build() {
  cd "$srcdir/DBIx-DBSchema-0.40"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/DBIx-DBSchema-0.40"
  make test
}

package() {
  cd "$srcdir/DBIx-DBSchema-0.40"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
