# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=muffon-bin
_pkgname=muffon
pkgver=1.4.0
pkgrel=1
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=('MIT')
options=()
conflicts=(muffon-appimage)
depends=(java-runtime at-spi2-core nss gtk3 alsa-lib)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha512sums=('2450f73ff5e96d32283f1898e730a8a6d8d4016368c06d87a4ac45ba39a1ab20e80559ecef5139b7e16be6b0febe54f2cc445eeb085821ad48d0b6f8d82b4e37')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Categories=Audio/Categories=AudioVideo/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}