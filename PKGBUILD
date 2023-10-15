# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=perl-tap-formatter-camelcade
pkgver=2023.1
pkgrel=1
pkgdesc='Converts test events from TAP::Harness to the TeamCity format'
_dist=TAP-Formatter-Camelcade
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-$pkgver.tar.gz")
sha256sums=('97019fa8d40c444e6ee50341759f93978625671805b01954e008ce01e9d2c532')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="$pkgdir"
}
