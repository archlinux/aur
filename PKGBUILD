# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-moreutil
_lastauthor=P/PE/PERLANCAR
_pkgname=File-MoreUtil
pkgver=0.624
pkgrel=1
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rinci')
checkdepends=('perl-file-slurper' 'perl-file-chdir')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('f298244a67683340bdc2b79397cf6bc1199abd406d35aa4eeb8702383455aa9250713b51d196c66d037210e76b3a8ea9c1a7803b76f34ef18134da2757602bf5')

conflicts=("perl-sharyanto-file-util")
provides=("perl-sharyanto-file-util")
replaces=("perl-sharyanto-file-util")

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd ${_pkgname}-${pkgver}
  perl Makefile.PL
  make
}
check() {
  cd ${_pkgname}-${pkgver}
  make test
}
package() {
  cd ${_pkgname}-${pkgver}
  make install
}

