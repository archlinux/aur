# Maintainer: John Regan <john@jrjrtech.com>
# Contributor: Anonymous

pkgname='perl-perlx-maybe'
pkgver='1.202'
pkgrel='1'
pkgdesc="PerlX::Maybe - return a pair only if they are both defined"
_dist=PerlX-Maybe
arch=('any')
url="http://metacpan.cpan.org/dist/_$dist"
license=('GPL' 'PerlArtistic')
options=('!emptydirs' purge)
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/${_dist}-${pkgver}.tar.gz")
md5sums=('d0af9cfe92f94a0b6adcba163f4e95a4')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

