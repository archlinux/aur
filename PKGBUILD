# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="pman"
pkgname="$_pkgname-helper"
pkgver="1.1.1"
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
    "908e8746681f3b0f65128a05bf954f24e0d57346"
)
sha256sums=(
    "ab090fa3c7e4e5c97725799e27106ccb5506b05e0f0d43c0688f26371376c771"
)
md5sums=(
    "04826025b56e9ab28f79f63cbb5b0f60"
)
package() {
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_pkgname}/pman.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
