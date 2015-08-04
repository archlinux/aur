# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.1
pkgrel=1
pkgdesc="High performance math library (Intel MKL) for Revolution R Open"
arch=('x86_64')
license=('custom')
url=('http://www.revolutionanalytics.com/revolution-r-open')
provides=('revolution-r-open-blas')
conflicts=('revolution-r-open-blas')
depends=('revolution-r-open')
install=('revomath.install')
source=("https://mran.revolutionanalytics.com/install/RevoMath-3.2.1.tar.gz")
sha512sums=('ecc8f5547cc3b633475981448bbcd8b91394cfc286e8f5e96cda50eaac7b441c449a1b42bd5c69be717d27d793ef8374dd0ebd18d21bc0a8f6244f5aa63f755f')
md5sums=('d64525debe5503143eea243954fc67bf')

package() {
  mkdir -p "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/RRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}