# CPAN Name  : WWW::Shorten
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-www-shorten
pkgver=3.04
pkgrel=1
pkgdesc='Interface to URL shortening sites'
arch=('any')
url='http://search.cpan.org/dist/WWW-Shorten'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-libwww')
optdepends=('perl-config-auto: for configuration file support')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/WWW-Shorten-3.04.tar.gz)
options=(!emptydirs)
md5sums=('a30a87a8d99fc2e8642a9bff2d752563')

build() {
  cd WWW-Shorten-3.04
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd WWW-Shorten-3.04
  make test
}

package() {
  cd WWW-Shorten-3.04
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
