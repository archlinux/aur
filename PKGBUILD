# Packager: M0Rf30

pkgname=perl-x500-dn
pkgver=0.29
pkgrel=3
pkgdesc='Handle X.500 DNs (Distinguished Names), parse and format them'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-parse-recdescent)
url=http://search.cpan.org/~rjoop/X500-DN-0.29/
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJOOP/X500-DN-$pkgver.tar.gz")

build()
(
  cd ${srcdir}
  cd X500-DN-$pkgver
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd ${srcdir}
  cd X500-DN-$pkgver
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd ${srcdir}
  cd X500-DN-$pkgver
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
md5sums=('48d364190ea638d2de985c4b38197818')
