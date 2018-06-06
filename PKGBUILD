# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=p99
pkgver=20170629
_pkgver=2017-06-29
pkgrel=1
pkgdesc="Preprocessor macros and functions for C99."
arch=('any')
url="http://p99.gforge.inria.fr/"
license=('GPL')

source=("http://p99.gforge.inria.fr/versions/${pkgname}-${_pkgver}.tgz"
        "http://p99.gforge.inria.fr/versions/${pkgname}-${_pkgver}-refman.pdf")

sha512sums=('ae1f966e12244aefd6ca32aff83b1d73a0b9cb09c91ce579c814cc64d188e886c38d7103265cb75b3338cc2c45108992e50e5290b0b30b57c6c29eccc1352ba0'
            '0ce1281112ae2729bb3407b6631d806015477da63ac38a1d94eea25e98b2c636badfcac977dd082f74156c18d13a5556142fce781394d74ebe9235eeefd1ac0e')

package() {
  cd "${srcdir}"/"${pkgname}"-"${_pkgver}"/"${pkgname}"

  mkdir -p "${pkgdir}"/usr/include/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"

  install -m 644 *.h "${pkgdir}"/usr/include/"${pkgname}"

  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"
  
  install -m 644 "${srcdir}"/${pkgname}-${_pkgver}-refman.pdf "${pkgdir}"/usr/share/doc/"${pkgname}"
}
