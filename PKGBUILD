# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="words-picker-bin"
pkgver=53.8.1
pkgrel=2
pkgdesc="Hope to become a good word retrieval application.希望成为一款好的取词应用"
arch=("x86_64")
url="https://github.com/ziqiangxu/words-picker"
license=('MIT')
depends=('libxext' 'qt5-x11extras' 'libxtst' 'libx11' 'gcc-libs' 'qt5-base' 'glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-deepin-20.6.deb"
    "LICENSE::https://raw.githubusercontent.com/ziqiangxu/words-picker/master/LICENSE")
sha256sums=('be666577f86f12afde1ec40a4283ca6e0b5d724e813faa9769261f9b05870596'
            '15c866670d9927e3c1dfe818f42be61b5e479ce7d63edb75471bf4a464be17e0')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}