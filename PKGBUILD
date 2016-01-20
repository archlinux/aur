# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=revomath
pkgver=3.2.3
pkgrel=1
pkgdesc="High performance math library (Intel MKL) for Microsoft R Open"
arch=('x86_64')
license=('custom')
url=('https://mran.revolutionanalytics.com/open/')
provides=('microsoft-r-open-blas')
conflicts=('microsoft-r-open-blas')
depends=('microsoft-r-open')
install=('revomath.install')
source=("https://mran.revolutionanalytics.com/install/mro/${pkgver}/RevoMath-${pkgver}.tar.gz")
md5sums=('25c2f9d192abbcffc827583c8ebd4f0a')
sha512sums=('f6ebb15f62a080eea8449d2109a1824379d8c88ea60421c2016b6b63e5af043b130020afa6f1092a922e411386c4601d5a44a877b499ab4d1a8d26023d7527c3')

package() {
  mkdir -p "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  cp "${srcdir}"/RevoMath/mkl/libs/* "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/lib"
  install -Dm644 "${srcdir}/RevoMath/RevoUtilsMath.tar.gz" "${pkgdir}/usr/lib/MRO-${pkgver}/R-${pkgver}/lib64/R/library/RevoUtilsMath.tar.gz"
  install -Dm644 "${srcdir}/RevoMath/mklLicense.txt" "${pkgdir}/usr/share/licenses/revomath/mklLicense.txt"
}
