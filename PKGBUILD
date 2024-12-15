# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="spotify_player"
_pkgname="${_binname//_/-}"
pkgname="${_pkgname}-bin"
pkgver=0.20.4
pkgrel=1
pkgdesc="A Spotify player in the terminal with full feature parity"
arch=('x86_64' 'aarch64')
url="https://github.com/aome510/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'dbus' 'gcc-libs' 'glibc' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname//-/_}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('20d3b4cf1a15d8d45b092d86d7262d06c44ab35b8264cba28460f4e59ba118c7'
            'e72a19894db78d4bb02cb1eff86920cddabd23b56d03f2f20850e07452db86d5')
sha256sums_x86_64=('274c898edc0cc4f66dd33f979e302fd3c065d677356cc553321526b79f7cac10')
sha256sums_aarch64=('7eecd3001a3df8a36dafd0303cad8e563a79aea98810735f400aa94b63a62217')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
