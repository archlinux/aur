# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-prima
_lastauthor=K/KA/KARASIK
_pkgname=Prima
pkgver=1.59
pkgrel=2
pkgdesc="a perl multiplatform graphic toolkit"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('BSD')
options=('!emptydirs')
depends=('perl-config-simple' 'perl-anyevent')
makedepends=('perl-extutils-makemaker')
checkdepends=()
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('ed0544a21f10cae465637632fab8cfc5515818486a6085191e0feca9c9f853aef690287fccb2a89507c5e6918fbedfac8606908a36a296d484528163648209ef')

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
