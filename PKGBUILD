# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="asMSX"
_pkgname="${_name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.1.1
_commit="194e3c5e09773f3edd354c4f73951e919a578371"
pkgrel=1
pkgdesc="Z80 cross-assembler for MSX"
arch=('x86_64' 'armv7h')
url="https://www.msx.org/wiki/AsMSX"
_url="https://github.com/Fubukimaru/${_name}"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/${_commit}/README.md"
        "LICENSE-${pkgver}.md::${_url}/raw/${_commit}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-linux-x86_64")
source_armv7h=("${_pkgsrc}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-linux-armhf")
sha256sums=('03d4c94d3d8a2bab79cd087aa3ea2854eb7e5b417eaf4b73aa79931d2ecdfa17'
            'a046cfdd1afe7b4c844c78c23bb66c4318ffeb42f9b563eb813a7fa5159b5030')
sha256sums_x86_64=('eca9f1bf391a9b73f25d3c123c1b79163f58ae9b89687d120cd35fa9bfc665a2')
sha256sums_armv7h=('6afd9044961a417b838f334770e1e26fe3c27180cd76638d38939376999bef63')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
