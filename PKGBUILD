# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netsend-bin
_pkgname=NetSend
pkgver=2.0.1
_githubver=2.0.0
pkgrel=1
pkgdesc="An intranet file transfer tool based on umijs + electron + javascript.一个基于 umijs + electron + javascript 构建的内网文件传输工具"
arch=('x86_64')
url="https://github.com/williamnie/netSend"
license=('GPL2')
conflicts=()
depends=(
    'nss'
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
)
options=()
source=(
  "${_pkgname}_${_githubver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${_githubver}_amd64.deb"
  "LICENSE::${url}/raw/main/LICENSE"
)
sha512sums=('d59f56f31ab8892f748373fadc6f915e51decf3e109ef107c4f9eb89147abfafb9223b42ee1ecb2388fae7be168a6c5cadfac85b1dc193d58de0a27fa46356bd'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')
 
prepare() {
    bsdtar -xf data.tar.xz
}
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
