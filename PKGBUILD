# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="huhnitor"
pkgname="${_pkgname}-bin"
pkgver=2.0.0
pkgrel=2
pkgdesc="An intergalactic serial monitor for the ESP8266 Deauther v3"
arch=(
  'x86_64'
)
url="https://github.com/SpacehuhnTech/Huhnitor"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'systemd-libs'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux"
)
sha256sums=('8fb7497845ae3983d1e7f8d9210fade00f2cdb9c5a3a331c2c9c6cdb6a774134'
            '5ae55d4b3a2a48c7c601a4bdb693be0d4a3ed9668e55d928991f8d61f8171e6e')
sha256sums_x86_64=('36d74f6bd093540070b26210df5081072cb80914a87d06665c72edb7c10e779f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
