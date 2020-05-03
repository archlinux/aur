# Contributor: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=perl-text-table-csv
pkgver=0.023
pkgrel=1
pkgdesc='This packages the Text-Table-CSV distribution, containing the Text::Table::CSV module'
_dist=Text-Table-CSV
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/$_dist-$pkgver.tar.gz")
md5sums=('99b75c089c77fd9c13db05035dfbb864')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
