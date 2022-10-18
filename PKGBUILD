# Contributor: John Regan <john@jrjrtech.com>
pkgname=perl-contextual-return
pkgver=0.004014
pkgrel=1
pkgdesc='Contextual::Return - Create context-sensitive return values'
_dist=Contextual-Return
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-want')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/${_dist}-${pkgver}.tar.gz")
md5sums=('5cb31f1637c17af6a8e5b852d820af79')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_USE_UNSAFE_INC=1 PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
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

