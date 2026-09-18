# Maintainer: Adam Mlady <adam.mlady@elevated.ovh>

_pkgname="hyprdown"
pkgname="${_pkgname}-bin"
pkgdesc="A CLI counterpart to hyprshutdown for Hyprland"
pkgver=0.2.0
pkgrel=1

arch=("any")
url="https://github.com/TheElevatedOne/hyprdown"
license=('BSD-3-Clause')
provides=('hyprdown')
conflicts=('hyprdown')
depends=('systemd' 'systemd-libs')
options=('!debug')

source=(
  "${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.tar.gz"
  'https://raw.githubusercontent.com/TheElevatedOne/hyprdown/refs/heads/main/LICENSE'
  'https://raw.githubusercontent.com/TheElevatedOne/hyprdown/refs/heads/main/README.md'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
