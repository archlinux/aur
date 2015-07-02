# Mantainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sys-filesystem-mountpoint
_lastauthor=L/LE/LEOCHARRE
_pkgname=Sys-Filesystem-MountPoint
pkgver=1.02
pkgrel=1
pkgdesc='shortcuts to resolve paths and devices to mount points'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sys-filesystem' 'perl-params-util' 'perl-getopt-std-strict')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('a173a7248d58eec09c3efc04c21e15d8d081fd93ccb6f7541818b6cca7f1772d')

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

