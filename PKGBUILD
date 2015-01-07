# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-glib-ex-objectbits
_realname=Glib-Ex-ObjectBits
_module=Glib::Ex::ObjectBits
pkgver=16
pkgrel=1
pkgdesc="${_module} -- misc Glib object helpers"
arch=('any')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('perl' 'gtk2-perl' 'glib-perl')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/K/KR/KRYDE/${_realname}-${pkgver}.tar.gz")
md5sums=('54be83717715e110e8934d6334d916aa')

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
