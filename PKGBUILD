# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.2
pkgrel=1
pkgdesc="High performance math library (Intel MKL) for Revolution R Open"
arch=('x86_64')
license=('custom')
url=('http://www.revolutionanalytics.com/revolution-r-open')
provides=('revolution-r-open-blas')
conflicts=('revolution-r-open-blas')
depends=('revolution-r-open')
install=('revomath.install')
source=("https://mran.revolutionanalytics.com/install/RevoMath-${pkgver}.tar.gz")
md5sums=('b1d79a3b544df8a55dd9e14e542d5bb6')
sha512sums=('b5a255cf4cde95f673f97200612fcc3a1ff3e579dc6e01d65c18bb7995b8467f26dd8d4c0cfdf589d54143f707d76c7aad449e926a5e37ee84a134a2c42e9478')

package() {
  mkdir -p "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}
