# Maintainer: Vasket <vasket at  dismail dot de>

pkgname="brig-git"
_pkgname="brig"
pkgver="git"
pkgrel="1"
pkgdesc="File synchronization on top of ipfs with git like interface and web based UI"
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
    go build
}

package() {
	cd "${_pkgname}"
  install -Dm755 "brig" "${pkgdir}/usr/bin/brig"

}

