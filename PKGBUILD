# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-prima
_lastauthor=K/KA/KARASIK
_pkgname=Prima
pkgver=1.65
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
sha512sums=('b679f62d147942596089b1cdef0df224268ac04a6025e2ec6e11803db3b728e0e95d771eed7ab2edeb019c479caa4715780ee1e16bc81e396616f629c88f5700')

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
