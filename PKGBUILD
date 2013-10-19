# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname=perl-path-tiny
pkgver=0.033
pkgrel=1
pkgdesc='A small and fast Perl module for working with file paths'
arch=('any')
url='http://search.cpan.org/dist/Path-Tiny'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-pathtools>=3.40' 'perl-autodie>=2.14' 'perl-digest>=1.03' 'perl-digest-sha>=5.45')
checkdepends=('perl>=5.13.4' 'perl-test-failwarnings')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.033.tar.gz)
options=(!emptydirs)
md5sums=('cb70291b1792998c4780eced3ca4d20a')

build() {
  cd Path-Tiny-0.033
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Path-Tiny-0.033
  make test
}

package() {
  cd Path-Tiny-0.033
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
