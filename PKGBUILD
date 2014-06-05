# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-devel-findref
_realname=Devel-FindRef
_module=Devel::FindRef
pkgver=1.44
pkgrel=1
pkgdesc="${_module} -- where is that reference to my variable hiding?"
epoch=1
arch=(i686 x86_64)
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_realname}-${pkgver}.tar.gz")
md5sums=('92902fc532153b8aadb94ace75367e5b')

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
