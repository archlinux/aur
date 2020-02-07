# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=intel-mkl-bin
_pkgname=mkl
_pkgver=2020.0
_build=166
pkgver="${_pkgver}.${_build}"
pkgrel=0
pkgdesc="Intel Math Kernel Library - shared libraries and headers only, as distributed by Anaconda"
arch=('x86_64')
url="https://software.intel.com/en-us/mkl"
license=('custom')
provides=('intel-mkl')
conflicts=('intel-mkl')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2"
        "https://repo.anaconda.com/pkgs/main/linux-64/mkl-include-${_pkgver}-${_build}.tar.bz2")
sha256sums=('59154b30dd74561e90d547f9a3af26c75b6f4546210888f09c9d4db8f4bf9d4c'
            '2af3494a4bebe5ddccfdc43bacc80fcd78d14c1954b81d2c8e3d73b55527af90')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  cp -drp --no-preserve=ownership "${srcdir}/include" "${pkgdir}/usr/include"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
