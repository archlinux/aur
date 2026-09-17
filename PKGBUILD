# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.7
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
sha256sums_x86_64=('12243ba369181c55f0d08b8c9846a3cbdd3251f774f8a4d1cb6ca2ef8bd6c439')
sha256sums_aarch64=('d52275aacdcb778523c959d94c609357779068b4ee691edf9bd4648e80f780b3')
options=(!strip !lto !debug)

package() {
    local _target="${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_target}/jb" "${pkgdir}/usr/bin/jb"
    install -Dm644 "${_target}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
