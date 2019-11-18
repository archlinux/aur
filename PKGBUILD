# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
pkgver=2.3.0
_build=py38h7b6447c_0
pkgrel=1
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl-service"
license=('custom')
provides=('python-mkl-service')
conflicts=('python-mkl-service')
depends=('python' 'intel-mkl')
source=("http://repo.continuum.io/pkgs/main/linux-64/${_pkgname}-${pkgver}-${_build}.tar.bz2")
sha256sums=('869be53b0b5fb2c6f50fefd77b2641454d799248e3c6366c86ddac20be5e5058')

package() {
  mkdir -p "${srcdir}/usr/"
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}