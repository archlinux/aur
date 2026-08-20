# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.5
pkgrel=1
pkgdesc="jujutsu TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/TD-Sky/jj-bond"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('jujutsu')
source_x86_64=("${pkgname}-x86_64-${pkgver}.zip::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.zip")
source_aarch64=("${pkgname}-aarch64-${pkgver}.zip::$url/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.zip")
sha256sums_x86_64=('b055cd4af719a01fbcea2889e8479514f348146608db2e8f20a72eb53b0e8542')
sha256sums_aarch64=('74ee5edfeb588aca13a45819310fe68a2639db2ec93c6c1b0730708f94074ec1')
options=(!strip !lto !debug)

package() {
    local _target="${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_target}/jb" "${pkgdir}/usr/bin/jb"
    install -Dm644 "${_target}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
