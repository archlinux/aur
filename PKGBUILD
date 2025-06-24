# Maintainer: sripwoud <me@sripwoud.xyz>
_binname=nordlayerd
_pkgname="${_binname}-runit"
pkgname="${_pkgname}-git"
pkgdesc="Runit service script for Nordlayer"
url="https://codeberg.org/sripwoud/${_pkgname}"
arch=('any')
depends=('runit' 'nordlayer')
install="${_pkgname}.install"
license=('AGPL-3.0-only')
makedepends=('git')
pkgrel=1
pkgver="r3.909df06"
sha256sums=('SKIP')
source=("git+${url}.git")

pkgver() {
    cd "${_pkgname}"
    # r<commit-count>.g<commit-hash>
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    install -Dm755 "run" "${pkgdir}/etc/runit/sv/${_pkgname}/run"
}
