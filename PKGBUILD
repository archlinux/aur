# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sleek-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
depends=('hicolor-icon-theme' 'glibc' 'libxdamage' 'nss' 'cairo' 'libxcb' 'dbus' 'at-spi2-core' 'alsa-lib' 'libx11' \
    'libxcomposite' 'mesa' 'gcc-libs' 'expat' 'libxkbcommon' 'libcups' 'gtk3' 'libdrm' 'nspr' 'libxrandr' 'libxfixes' 'libxext' 'glib2' 'pango')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ransome1/sleek/master/LICENSE")
sha256sums=('131bd6b3334121d95f73f26dc0be398e4f103ba287810ce2642d6f1af1b1b4ea'
            'f963f2758913728f2446d9a0d5fa4e5636c649e8beaffe172e7331023adf2d3d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}