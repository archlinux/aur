# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname=perl-path-tiny
pkgver=0.044
pkgrel=1
pkgdesc='A small and fast Perl module for working with file paths'
arch=('any')
url='http://search.cpan.org/dist/Path-Tiny'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.17.8')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.044.tar.gz)
options=(!emptydirs)
md5sums=('348efaf555b38bd5ecffbbfc8a82ee3b')

build() {
  cd Path-Tiny-0.044
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Path-Tiny-0.044
  make test
}

package() {
  cd Path-Tiny-0.044
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
