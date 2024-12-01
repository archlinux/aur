# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="spotify_player"
_pkgname="${_binname//_/-}"
pkgname="${_pkgname}-bin"
pkgver=0.20.3
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
sha256sums=('aa0f8a7d483395d2ea7e3e74c08ec61429cec41379dcf2b469f841b533feabf5'
            'e72a19894db78d4bb02cb1eff86920cddabd23b56d03f2f20850e07452db86d5')
sha256sums_x86_64=('f6cda6938de850a93d3d24e9ec9fe6b79634a1bd500dee539bb3a3fd773189d1')
sha256sums_aarch64=('403b8b23b7334991106a76348bbc5c8633ec04241b967e616a2fa7b83adce2eb')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
