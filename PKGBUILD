# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frame-cast-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="An application that allows you to stream a particular region of your screen to a window. This window can then be shared on video conferencing applications such as Google Meet."
arch=("x86_64")
url="https://github.com/nathan-fiscaletti/framecast"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxkbcommon' 'libcups' 'cairo' 'at-spi2-core' 'libx11' 'expat' 'dbus' 'nss' 'pango' 'libdrm' 'nspr' 'gtk3' 'libxrandr' \
    'libxext' 'alsa-lib' 'hicolor-icon-theme' 'libxdamage' 'mesa' 'glibc' 'libxfixes' 'libxcomposite' 'libxcb' 'glib2' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/nathan-fiscaletti/framecast/main/LICENSE")
sha256sums=('b0d1ba8fc74fa57caee9ed67abcb5bff97c73af41371920af3a29d1defb3b958'
            '7c7be32e763aaac6bdc8702c430ecd9cf84bbdee8e53071979c5ed2fad37dbf8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}