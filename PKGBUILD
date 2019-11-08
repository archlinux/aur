# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-tap-formatter-camelcade
pkgver=0.009
pkgrel=1
pkgdesc='Converts test events from TAP::Harness to the TeamCity format'
_dist=TAP-Formatter-Camelcade
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-$pkgver.tar.gz")

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

sha256sums=('469c34d2c39e377e1d6626faf77feea674c728b6f39ff78e2f2c92827a8dbb98')
