# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=viennacl
_pkgname=ViennaCL
pkgver=1.6.2
_pkgver=1.6.x
pkgrel=1
pkgdesc="The library provides high level C++ interfaces for linear algebra routines on CPUs and GPUs using CUDA, OpenCL and OpenMP."
arch=('any')
url="http://viennacl.sourceforge.net/"
depends=("libcl" "opencl-headers")
optdepends=("cuda" "opencl-nvidia") 
license=('custom')

source=("http://iweb.dl.sourceforge.net/project/${pkgname}/${_pkgver}/${_pkgname}-${pkgver}.tar.gz")

sha512sums=('70855a0bf28fa6f2389f7f1f7e3aa1824913124a62edd98524e6b9818804eec1e4565eab9722dc5e6ccf86b2b60a78b414d856b7c2ad02ed196c895b71e8b637')

package() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"

  mkdir -p "${pkgdir}"/usr/include
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"

  cp -r "${pkgname}" "${pkgdir}"/usr/include
  chmod -R 755 "${pkgdir}"/usr/include/"${pkgname}"/

  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"
  
#  install -m 644 doc/"${pkgname}".pdf "${pkgdir}"/usr/share/doc/"${pkgname}"
}


