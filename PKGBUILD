# CPAN Name  : WWW::Shorten
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-www-shorten
pkgver=3.05
pkgrel=1
pkgdesc='Interface to URL shortening sites'
arch=('any')
url='http://search.cpan.org/dist/WWW-Shorten'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-libwww')
optdepends=('perl-config-auto: for configuration file support')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/WWW-Shorten-3.05.tar.gz)
options=(!emptydirs)
md5sums=('bdc5be1fac9ec6310e7c8163f29f4d47')

build() {
  cd WWW-Shorten-3.05
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd WWW-Shorten-3.05
  make test
}

package() {
  cd WWW-Shorten-3.05
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
