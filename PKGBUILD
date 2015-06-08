# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=fort77
pkgver=1.18
pkgrel=3
url="http://pubs.opengroup.org/onlinepubs/009696699/utilities/fort77.html"
license=("custom")
pkgdesc="Compile Fortran code with your favourite C compiler (set CC)."
arch=('i686' 'x86_64')
depends=('f2c' 'perl')

source=("ftp://ftp.icm.edu.pl/pub/Linux/sunsite/devel/lang/fortran/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bfb3d054b92f97c63bdeb4bd31193824d8ab0469b47aed7d43ec5a66368e097d')

check (){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 ${pkgname} \
    ${pkgdir}/usr/bin/fort77
  install -Dm644 ${pkgname}.1 \
    ${pkgdir}/usr/share/man/man1/fort77.1
  install -Dm644 ${pkgname}-${pkgver}.lsm \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}
