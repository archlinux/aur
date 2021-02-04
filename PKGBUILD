# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.56
pkgrel=1
pkgdesc="General purpose pipe-oriented plotting tool"
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/feedgnuplot/archive/v${pkgver}.tar.gz")
sha256sums=("93943aee58f124cc21f70267fcfba48ec70a8dc112ddcba075afe074b51270bc")

build() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
