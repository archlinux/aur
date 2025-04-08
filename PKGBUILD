# Maintainer:       Manawyrm <aur@tbspace.de>
# Original Source:  https://github.com/Manawyrm/gpd-pocket-4-pipewire

_pkgname=gpd-pocket-4-pipewire
pkgname="${_pkgname}"
pkgver=0.0.1
pkgrel=1
pkgdesc="Pipewire audio DSP for internal speakers of GPD Pocket 4"
arch=('any')
url='https://github.com/Manawyrm/gpd-pocket-4-pipewire/tree/main/gpd-pocket-4-pipewire'
license=('MIT')
depends=(
  'lv2'
  'bankstown'
  'lsp-plugins-lv2'
  'pipewire'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
replaces=(
  "${_pkgname}<${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  'gpd-pocket-4-pipewire::git+https://github.com/Manawyrm/gpd-pocket-4-pipewire'
)
sha256sums=(
  'SKIP'
)

package() {
  cd "${srcdir}/gpd-pocket-4-pipewire/pipewire.conf.d/"
  install -dDm0755 "${pkgdir}/usr/share/pipewire/pipewire.conf.d/"
  install -v -D -m0644 "gpd-pocket-4-mp-48k-l.wav" "${pkgdir}/usr/share/pipewire/pipewire.conf.d/gpd-pocket-4-mp-48k-l.wav"
  install -v -D -m0644 "gpd-pocket-4-mp-48k-r.wav" "${pkgdir}/usr/share/pipewire/pipewire.conf.d/gpd-pocket-4-mp-48k-r.wav"
  install -v -D -m0644 "sink-gpd-pocket-4.conf" "${pkgdir}/usr/share/pipewire/pipewire.conf.d/sink-gpd-pocket-4.conf"
}
