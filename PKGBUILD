# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dopamine-bin
_pkgname=dopamine
pkgver=3.0.0.preview19
pkgrel=1
pkgdesc="The audio player that keeps it simple"
arch=('x86_64')
url="https://github.com/digimezzo/dopamine"
license=(GPL3)
depends=(alsa-lib gtk3 nss at-spi2-core)
conflicts=(dopamine-appimage-preview)
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v3.0.0-preview19/Dopamine-3.0.0-preview.19.pacman")
sha256sums=('60f58ec0aafc1c42c855311e4dd02e824c878f9bdc3afdb04222b15c926246b0')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    sed 's/Categories=Audio/Categories=AudioVideo/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
