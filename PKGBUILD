# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=intel-mkl-bin
_pkgname=mkl
pkgver=2019.5
_build=281
pkgrel=1
pkgdesc="Intel Math Kernel Library - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://software.intel.com/en-us/mkl"
license=('custom')
provides=('intel-mkl')
conflicts=('intel-mkl')
source=("http://repo.continuum.io/pkgs/main/linux-64/${_pkgname}-${pkgver}-${_build}.tar.bz2")
sha256sums=('040bed2cb07db1e74b46e2a47fbb31c4173932f05acabfe4433f20549b17cbfc')

package() {
  mkdir -p "${srcdir}/usr/"
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}