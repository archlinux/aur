# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.4
pkgrel=1
pkgdesc="High performance math library (Intel MKL) for Microsoft R Open"
arch=('x86_64')
license=('custom')
url='https://mran.revolutionanalytics.com/open/'
provides=('microsoft-r-open-blas')
conflicts=('microsoft-r-open-blas')
depends=('microsoft-r-open')
install='revomath.install'
source=("https://mran.revolutionanalytics.com/install/mro/${pkgver}/RevoMath-${pkgver}.tar.gz")
md5sums=('13ac010c4873d4e3baed98cdafe764e1')
sha512sums=('7788c303c396bc376aba2499fa1f986755dec3add5084f1a6d0791118ae4d990f605e70b3dc65e049ab223e484eccf0881903499ce777eb264c9bd4343b203fd')

package() {
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}
