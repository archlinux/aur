# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=jj-bond-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.6
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
sha256sums_x86_64=('593c046b56a7ba8615a3d373ba800f3e9522fd938fc544f9448682a7a82533a2')
sha256sums_aarch64=('0629eefb2e685cfeea2010e19878ca70bfbf3abbf5d28fe32e47d0a93cd4f7e0')
options=(!strip !lto !debug)

package() {
    local _target="${_pkgname}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_target}/jb" "${pkgdir}/usr/bin/jb"
    install -Dm644 "${_target}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
