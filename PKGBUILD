# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-devel-findref
_realname=Devel-FindRef
_module=Devel::FindRef
pkgver=1.422
pkgrel=2
pkgdesc="${_module} -- where is that reference to my variable hiding?"
arch=(i686 x86_64)
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('perl')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz")
md5sums=('2c92401767653f1ba8b98f36f23fae8d')

build() {
  cd  "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "$srcdir/$_realname-$pkgver"
  make test
}

package() {
  cd  "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
