# Maintainer: Christian Mauderer <c_mauderer[at]yahoo[dot]de>

pkgname=perl-string-compare
pkgver=0.4
pkgrel=1
pkgdesc="String::Compare - Compare two strings and return how much they are alike"
arch=('any')
url="http://search.cpan.org/dist/String-Compare"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/D/DR/DRUOSO/String-Compare-${pkgver}.tar.gz")
md5sums=('0a5ba97f0a071dd23c0ebe1b8ef4c2c3')

build() {
  cd  $srcdir/String-Compare-$pkgver

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1
}

