# Montainer: 3ED <krzysztof1987 at gmail dot com>

pkgname=perl-prima
_lastauthor=K/KA/KARASIK
_pkgname=Prima
pkgver=1.63
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
sha512sums=('401187ac7590f0c598405f8b4d64d814fbb0c249e6a57f2ae27178fcf7d13a297899b58099f0b9acfd79409ca20bc961ede7dc7a123a18dd92f42b0d8d7d4127')

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
