# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
_pkgver=2.3.0
_build=py38h7b6447c_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=0
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl-service"
license=('custom')
provides=('python-mkl-service')
conflicts=('python-mkl-service')
depends=('python' 'intel-mkl')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('869be53b0b5fb2c6f50fefd77b2641454d799248e3c6366c86ddac20be5e5058')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}