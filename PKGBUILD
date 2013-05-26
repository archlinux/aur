# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=perlconsole
pkgver=0.4
pkgrel=3
pkgdesc="A lightweight perl REPL using Term::Readline"
arch=(any)
url="http://www.sukria.net/perlconsole.html"
license=(GPL2)
depends=(perl-term-readline perl-module-refresh perl-lexical-persistence perl-b-keywords)
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SUKRIA/$pkgname-$pkgver.tar.gz)
md5sums=('4a31b5f720b3c05f1a5564ce78459f22')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
md5sums=('4a31b5f720b3c05f1a5564ce78459f22')
