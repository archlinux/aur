# CPAN Name  : WWW::Shorten
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-www-shorten
pkgver=3.03
pkgrel=1
pkgdesc='Interface to URL shortening sites'
arch=('any')
url='http://search.cpan.org/dist/WWW-Shorten'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-libwww')
optdepends=("perl-config-auto: for configuration file support")
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/WWW-Shorten-3.03.tar.gz)
options=(!emptydirs)
md5sums=("8ba21ec85951c5ed7f87e2ea28280882")

build() {
  cd "$srcdir/WWW-Shorten-3.03"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/WWW-Shorten-3.03"
  make test
}

package() {
  cd "$srcdir/WWW-Shorten-3.03"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
