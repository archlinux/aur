# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-unix-pid
_lastauthor=D/DM/DMUEY
_pkgname=Unix-PID
pkgver=0.23
pkgrel=3
pkgdesc='Perl extension for getting PID info.'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('f52617b55ecd4a2c93379228721c47cf129cf9ba94a62ac22409b6f0f5b2b4a8')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL
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

