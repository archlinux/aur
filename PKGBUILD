# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="tabaur-bin"
_pkgname="TabAUR"
pkgver=0.6.9
pkgrel=1
pkgdesc="A customizable and lightweight AUR helper, designed to be simple but powerful."
arch=('x86_64' 'aarch64')
url="https://github.com/BurntRanch/TabAUR"
license=('GPL2')
depends=('pacman' 'curl')
optdepends=(
  "sudo: privilege elevation"
  "opendoas: privilege elevation"
  "git: use AUR packages git repos"
  "tar: use AUR packages tarballs"
)
conflicts=('tabaur' 'tabaur-git')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.zst")
sha256sums=("b40ce475dd44dd77156ba5eb1352803cbfb4ebabfa8e3c7e0bd768aed5c69fa3")

package() {
    cd "${srcdir}/"
    install -Dm755 "taur" "${pkgdir}/usr/bin/taur"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find locale -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/{}" \;
}
