# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=perl-gtk2-ex-form-factory
_realname=Gtk2-Ex-FormFactory
_module=Gtk2::Ex::FormFactory
pkgver=0.67
pkgrel=1
pkgdesc="${_module} -- makes building complex GUI's easy"
arch=('any')
url="https://metacpan.org/release/${_realname}"
license=('LGPL' 'Perl')
depends=('perl' 'gtk2-perl' 'perl-gtk2-ex-simple-list')
conflicts=('perl-gtk2-ex-formfactory')
options=('!emptydirs')
source=("https://www.exit1.org/packages/${_realname}/dist/${_realname}-${pkgver}.tar.gz")
sha1sums=('1d42ad798a16efb212d984b3d38b630a8bf1cdb3')

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
