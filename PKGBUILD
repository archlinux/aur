# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-tie-handle-offset
_lastauthor=D/DA/DAGOLDEN
_pkgname=Tie-Handle-Offset
pkgver=0.004
pkgrel=1
pkgdesc='Tied handle that hides the beginning of a file'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=(perl)
url="https://metacpan.org/release/${_pkgname}/"
source=("https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ee9f39055dc695aa244a252f56ffd37f8be07209b337ad387824721206d2a89e')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl ./Makefile.PL
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
}

