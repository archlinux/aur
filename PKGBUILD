# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xmachoviewer-bin
pkgver=0.04
pkgrel=2
pkgdesc="Mach-O viewer for Windows, Linux and MacOS"
arch=(x86_64)
url="https://horsicq.github.io/#xmachoviewer"
_githuburl="https://github.com/horsicq/XMachOViewer"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs' 'qt5-base')
optdepends=()
provides=()
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_Ubuntu_22.04_amd64.deb"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('b39f9470d3b85e84b5123349a25e35ad414371c96d2980ac035780b6f69d2a8b'
            '170a42e355c8c547bc049876f498a4725b4d9841d167bd4e90296f37283cf57b')
package() {
	bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}