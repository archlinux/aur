# Maintainer: Max Pray a.k.a. <synthead@gmail.com>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-libdnet
_cpanname="Net-Libdnet"
pkgver=0.98
pkgrel=3
pkgdesc="Binding for Dug Song's libdnet"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.5.0' 'perl-class-gomor' 'libdnet')
makedepends=('perl-extutils-makemaker')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/G/GO/GOMOR/${_cpanname}-${pkgver}.tar.gz")
md5sums=('556bb84c712f0b65b8c0b252cae4fc16')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
