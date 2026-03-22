# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asmsx"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="Z80 cross-assembler for MSX"
arch=(
  'armv7h'
  'x86_64'
)
url="https://www.msx.org/wiki/AsMSX"
_url="https://github.com/Fubukimaru/asMSX"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/${pkgver}/LICENSE.md"
)
source_armv7h=(
  "${_pkgsrc}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-linux-armhf"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-linux-x86_64"
)
sha256sums=('03d4c94d3d8a2bab79cd087aa3ea2854eb7e5b417eaf4b73aa79931d2ecdfa17'
            'a046cfdd1afe7b4c844c78c23bb66c4318ffeb42f9b563eb813a7fa5159b5030')
sha256sums_armv7h=('99caf416428cacd5efc5669ebda01009065e5b6d2ed0bc2672e1fe1e7edb3848')
sha256sums_x86_64=('9e5c4ea1cbf2b296503bf22b1ca7f1454833fdbc66d3ebaee67e58a57310e294')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
