# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-moreutil
_lastauthor=P/PE/PERLANCAR
_pkgname=File-MoreUtil
pkgver=0.623
pkgrel=1
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rinci')
checkdepends=('perl-file-slurper' 'perl-file-chdir')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('a5806bdf93a805f64417d595d848e0e7e8b9fb0639ea1ec9d8c30e2808d3ed4e91127c0e069a7321617f372e62c9cd0accf51e9c857907b2dfb62645c2b5e918')

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

