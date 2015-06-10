# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-gtk2-ex-listmodelconcat
_realname=Gtk2-Ex-ListModelConcat
_module=Gtk2::Ex::ListModelConcat
pkgver=10
pkgrel=2
pkgdesc="${_module} -- concatenated list models"
arch=('any')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('perl' 'gtk2-perl' 'perl-gtk2-ex-widgetbits')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/K/KR/KRYDE/${_realname}-${pkgver}.tar.gz")
md5sums=('512e3d0467f8b6a1e6682ce6fe1a35b5')

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
