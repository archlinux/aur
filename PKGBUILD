# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.10
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
sha256sums_x86_64=('d8cf7b7532023118687bc4523b5f056847d436a21de44f25e5673064150c1572')
sha256sums_aarch64=('d8309aafb7ea9609846e53e63c73d5acdb2f3c9ac2e583ffbd415c33dd9a7c7c')
options=(!strip !lto !debug)

package() {
    local _target="${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_target}/jb" "${pkgdir}/usr/bin/jb"
    install -Dm644 "${_target}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
