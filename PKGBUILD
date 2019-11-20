# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numexpr-mkl-bin
_pkgname=numexpr
_pkgver=2.7.0
_build=py38h9e4a6bb_0
_build_number=0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=0
pkgdesc="Fast numerical array expression evaluator for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/pydata/numexpr"
license=('MIT')
provides=('python-numexpr')
conflicts=('python-numexpr')
depends=('python-mkl-service' 'python-numpy')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('2bbeaa19f443e53d251beb57c058f84a79960eba1271b072753c0eda6deca374')

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}