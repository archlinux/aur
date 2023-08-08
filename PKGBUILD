# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-bin
pkgver=2.0.0_dev3
pkgrel=2
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'glibc' 'libxdamage' 'nss' 'cairo' 'libxcb' 'dbus' 'at-spi2-core' 'alsa-lib' 'libx11' \
    'libxcomposite' 'mesa' 'gcc-libs' 'expat' 'libxkbcommon' 'libcups' 'gtk3' 'libdrm' 'nspr' 'libxrandr' 'libxfixes' 'libxext' 'glib2' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ransome1/sleek/master/LICENSE")
sha256sums=('78cacffb28fa422b2b278e63ed4dba3e57b1a186dbf9c3a186f6dcd1ceb138d2'
            'f963f2758913728f2446d9a0d5fa4e5636c649e8beaffe172e7331023adf2d3d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}