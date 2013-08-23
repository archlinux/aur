# CPAN Name  : SQL::ReservedWords
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-sql-reservedwords
pkgver=0.8
pkgrel=1
pkgdesc="Perl module that prodives list of SQL reserved words"
arch=("any")
url="http://search.cpan.org/dist/SQL-ReservedWords"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-sub-exporter")
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/SQL-ReservedWords-0.8.tar.gz)
options=(!emptydirs)
md5sums=("7de3ba15d2455b20cbaf692f28e5b633")

build() {
  cd "$srcdir/SQL-ReservedWords-0.8"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/SQL-ReservedWords-0.8"
  make test
}

package() {
  cd "$srcdir/SQL-ReservedWords-0.8"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
