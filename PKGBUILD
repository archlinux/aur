# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="pman"
pkgname="$_pkgname-helper"
pkgver="1.1.2"
pkgrel="1"
pkgdesc="A pacman helper script, because you forget all the stupid flags"
url="https://git.bjphoster.com/source/${_pkgname}"
arch=("any")
license=("MIT")
depends=("bash" "pacman")
conflicts=("pman") # Another package called `pman` currently exists in the AUR
source=(
    "https://git.bjphoster.com/source/${_pkgname}/archive/${pkgver}.tar.gz"
)
sha1sums=(
  "af045144e207157c2e615cedf615e68a07c1af85"
)
sha256sums=(
  "9ac3b495130d8d296e8cda1c9fdf7a908679c722ab746cdc8ff2e85606dac88a"
)
md5sums=(
  "33cd29b90bcf74946489e39271cbeb99"
)
package() {
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/pman.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
