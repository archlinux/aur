# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-ex-splash
_realname=Gtk2-Ex-Splash
_module=Gtk2::Ex::Splash
pkgver=52
pkgrel=1
pkgdesc="${_module} -- toplevel splash widget"
arch=('any')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('gtk2-perl')
checkdepends=('perl-devel-findref')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/K/KR/KRYDE/${_realname}-${pkgver}.tar.gz")
md5sums=('47a0d0a4c5407f180d2f11eb77b1b614')

build() {
  cd  "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "$srcdir/$_realname-$pkgver"
# make test
}

package() {
  cd  "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
