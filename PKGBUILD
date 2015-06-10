# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-ex-widgetbits
_realname=Gtk2-Ex-WidgetBits
_module=Gtk2::Ex::WidgetBits
pkgver=48
pkgrel=1
pkgdesc="${_module} -- concatenated list models"
arch=('any')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('perl' 'gtk2-perl' 'perl-glib-ex-objectbits' 'perl-scope-guard' 'perl-test-weaken')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/K/KR/KRYDE/${_realname}-${pkgver}.tar.gz")
md5sums=('f65aadb9213492b2ceaad874c5b49943')

build() {
  cd  "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "$srcdir/$_realname-$pkgver"
#  make test
}

package() {
  cd  "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
