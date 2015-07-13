# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=p99
pkgver=2015022
_pkgver=2015-02-22
pkgrel=1
pkgdesc="Preprocessor macros and functions for C99."
arch=('any')
url="http://p99.gforge.inria.fr/"
license=('GPL')

source=("http://p99.gforge.inria.fr/versions/${pkgname}-${_pkgver}.tgz"
        "http://p99.gforge.inria.fr/versions/${pkgname}-${_pkgver}-refman.pdf")

sha512sums=('89e58e9ced3f91bc2f6e1c96e8ae2a46d7dfd8b98db63c450794cb97c61de275868394def6953dd91a259e1b5fa42a2ae1bb435b2b89d4186df77253145f83d8' \
'65b672d86c8d65495b8697a8c41b9bcb11bb181ebd6e0a141d7f496aed005154309cff4f7ca1bdefb473946456b33721078d1f9d73ed377869e35e842f6e3e60')

package() {
  cd "${srcdir}"/"${pkgname}"-"${_pkgver}"/"${pkgname}"

  mkdir -p "${pkgdir}"/usr/include/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"

  install -m 644 *.h "${pkgdir}"/usr/include/"${pkgname}"

  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"
  
  install -m 644 "${srcdir}"/${pkgname}-${_pkgver}-refman.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"
}
