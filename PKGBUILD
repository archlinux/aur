# Maintainer: sripwoud <me@sripwoud.xyz>
_pkgname=trezord-runit
pkgname="${_pkgname}-git"
pkgdesc="${_pkgname} runit service"
url="https://codeberg.org/sripwoud/${_pkgname}"
arch=('any')
depends=('runit' 'trezor-bridge-bin')
install=trezord.install
license=('AGPL-3.0-only')
makedepends=('git')
pkgrel=1
pkgver="r7.f9565f4"
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
