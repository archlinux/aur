# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-random-bin
_pkgname=mkl_random
_pkgver=1.1.1
_build=py38h0573a6f_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=1
pkgdesc="Sampling probability distributions using Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl_random"
license=('custom')
provides=('python-mkl-random')
conflicts=('python-mkl-random')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('b949323969ac27374f1f324ef55e0a06e07ebf35463cf40d950f6fa82df2a96e')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}