# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.3
pkgrel=2
pkgdesc="High performance math library (Intel MKL) for Microsoft R Open"
arch=('x86_64')
license=('custom')
url='https://mran.revolutionanalytics.com/open/'
provides=('microsoft-r-open-blas')
conflicts=('microsoft-r-open-blas')
depends=('microsoft-r-open')
install='revomath.install'
source=("https://mran.revolutionanalytics.com/install/mro/${pkgver}/RevoMath-${pkgver}.tar.gz")
md5sums=('a29138dbb6cd29003bd794b0ef515e5a')
sha512sums=('295efb39044f4b883a7b1eb52cd9cc53d7a170126b83a6c4a930d60c51bf09443c59e53884f484f1b77956d41c4fe1b64995ffebbafc2ff6246a6e72d82f084b')

package() {
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}
