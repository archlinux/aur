# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-sys-gamin
_cpanname=Sys-Gamin
_module=Sys::Gamin
pkgver=0.1
pkgrel=3
pkgdesc="$_module - Perl interface to Gamin (File Access Monitor implementation)"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_cpanname"
license=('LGPL' 'Perl')
depends=('perl' 'gamin')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/G/GA/GARNACHO/${_cpanname}-${pkgver}.tar.gz")
md5sums=('4eb05138c28e8a5f12340938b0823a4c')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
#  make test
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
