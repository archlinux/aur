# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-file-moreutil
_lastauthor=P/PE/PERLANCAR
_pkgname=File-MoreUtil
pkgver=0.61
pkgrel=1
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rinci')
checkdepends=('perl-file-slurper' 'perl-file-chdir')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('168f13d807acd3df5ba71ffb02d1c04e58977a56e8d76ac002511717ed6cc085d8fe017aa356abfdd0562816e7aa44eb224b9f415770321f166ec2cea81ad58c')

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

