# CPAN Name  : Module::Refresh
# Contributor: Daenyth
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-module-refresh
pkgver=0.17
pkgrel=1
pkgdesc="Perl module to refresh %INC files when updated on disk"
arch=("any")
license=("GPL" "PerlArtistic")
url="http://search.cpan.org/dist/Module-Refresh"
options=(!emptydirs)
depends=("perl")
checkdepends=("perl-path-class") # 'perl' provides 'perl-test-simple' and 'perl-file-temp'
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Module-Refresh-0.17.tar.gz)
md5sums=("b077d06cab125aaff940d859945727f4")

build() {
  cd "$srcdir/Module-Refresh-0.17"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Module-Refresh-0.17"
  make test
}

package() {
  cd "$srcdir/Module-Refresh-0.17"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
