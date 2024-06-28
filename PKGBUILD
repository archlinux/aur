# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="safecloset"
pkgname="${_pkgname}-bin"
pkgver=1.3.2
pkgrel=1
pkgdesc="Cross-platform Secure TUI Secret Locker"
arch=('x86_64')
url="https://github.com/Canop/${_pkgname}"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/LICENSE"
        "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.zip")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            'bd68a0c0ada115a3435fc84a8c916238383dc7aec923c71da15e6831079e37f7')

package() {
  cd "${srcdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${CARCH}-linux"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
