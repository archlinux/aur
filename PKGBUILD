# Maintainer: Vasket <vasket at  dismail dot de>

pkgname="brig-git"
_pkgname="brig"
pkgver="develop"
pkgrel="5"
pkgdesc="File synchronization on top of ipfs with git like interface and web based UI -- development branch"
arch=(x86_64 i686 armv7h aarch64)
license=("AGPLv3")
url="https://github.com/sahib/${_pkgname}"
depends=(go)
makedepends=(git)
provides=("brig")

source=("git+https://github.com/sahib/${_pkgname}")
sha256sums=("SKIP")

build() {
    cd "${_pkgname}"
    git checkout develop
    GOBIN="${srcdir}/${_pkgname}" go run mage.go b
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
