# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.5
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
md5sums=('b23e4c30f7ced724ee560383798b7e50')
sha512sums=('e601741f0fbfd9526df35b9aee5fde48fcca58c8cf64b8e9f4514ca461e195faee21cf2e53c219ed45e3df85a430463a91b7d369924242566c1e17e01fa811e8')

package() {
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}
