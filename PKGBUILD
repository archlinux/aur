# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-prima
_lastauthor=K/KA/KARASIK
_pkgname=Prima
pkgver=1.60
pkgrel=1
pkgdesc="a perl multiplatform graphic toolkit"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
options=('!emptydirs')
depends=('perl-config-simple' 'perl-anyevent')
makedepends=('perl-extutils-makemaker')
checkdepends=()
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('b43d38f99ce6072959ad2dc6d19d69c9a7a02bf176dd35fc224a8068b849db1aca464f481e5bce8827e854528453dbe21b8e296b2c60dc36e661a083559eb114')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  perl Makefile.PL
  make
}
#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  make test
#}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
}
