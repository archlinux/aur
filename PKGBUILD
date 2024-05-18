# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur-bin"
_pkgname="TabAUR"
pkgver=0.6.7
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
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.zst")
sha256sums=("7b20cc048148ad86afcaf652811f0610f846a8d3a5902c6faf59ab7285714404")

package() {
    cd "${srcdir}/"
    install -Dm755 "taur" "${pkgdir}/usr/bin/taur"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find locale -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/{}" \;
}
