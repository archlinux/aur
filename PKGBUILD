# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-xml-dumper
_cpanname=XML-Dumper
_module=XML::Dumper
pkgver=0.81
pkgrel=2
pkgdesc="$_module - perl module for dumping perl objects from/to XML"
arch=('any')
license=('unknown')
url="https://metacpan.org/release/$_cpanname"
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MI/MIKEWONG/${_cpanname}-${pkgver}.tar.gz")
md5sums=('10726bbe78bef5e4264d5f57533da7c1')

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
