# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur-bin"
_pkgname="TabAUR"
pkgver=0.6.4
pkgrel=1
pkgdesc="A customizable and lightweight AUR helper, designed to be simple but powerful."
arch=('x86_64' 'aarch64')
url="https://github.com/BurntRanch/TabAUR"
license=('GPL3')
depends=('pacman' 'curl')
optdepends=(
  "sudo: privilege elevation"
  "doas: privilege elevation"
  "git: for using the AUR git repo"
  "tar: for using the AUR tarball repo"
)
source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.zst"
  "${url}/raw/main/LICENSE"
)
sha256sums=(
  "3b7b33d4902a13c0cbd5925baa2587b4317c222f5486b3cb19094c2adc43bf46"
  "SKIP"
)

package() {
    cd "${srcdir}/"
    install -Dm755 "taur" "${pkgdir}/usr/bin/taur"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
