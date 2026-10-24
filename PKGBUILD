# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.9
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
sha256sums_x86_64=('cf34dca0c8f11ed2dab1a419285da7cb7949cc66e03b32a0c5aad8a28abeb3d4')
sha256sums_aarch64=('a0690ef4e6a0a7804424bcbdfb25c9b7cf2e08dc4aad3124f64da194f043d042')
options=(!strip !lto !debug)

package() {
    local _target="${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_target}/jb" "${pkgdir}/usr/bin/jb"
    install -Dm644 "${_target}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
