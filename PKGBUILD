# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="linux-syscall-support"
pkgver=2024.02.01
pkgrel=1
pkgdesc="Linux Syscall Support"
arch=('any')
url="https://chromium.googlesource.com/${pkgname}"
license=('BSD-3-Clause')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/+archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d71ff9ae975b24965ac5d647d380e1e72f9270f5799f30752e2d25ecbdc880db1a10f9feada29acf1aec4a795a1fc457278823a46d08b0a7dd97a65f323798c6')

check() {
  cd "${srcdir}/tests"
  make
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname//-/_}.h" "${pkgdir}/usr/include/${pkgname//-/_}.h"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
