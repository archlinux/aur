# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pocket-casts-desktop-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="The Pocket Casts webapp, packaged for the Linux Desktop."
arch=('x86_64')
url="https://github.com/felicianotech/pocket-casts-desktop-app"
license=('MIT')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'alsa-lib' 'gtk3' 'nss' 'glibc' 'cairo' 'mesa' 'libxrandr' 'libxcomposite' \
        'libxfixes' 'pango' 'nspr' 'libxdamage' 'libdrm' 'libcups' 'expat' 'libxcb' 'dbus' 'gcc-libs' \
        'glib2' 'libxext' 'libx11' 'libxkbcommon' 'gdk-pixbuf2')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/felicianotech/pocket-casts-desktop-app/trunk/LICENSE")
sha256sums=('9c7745f510ce90cf47c3098afdac6220f3389e62ab5a9fc51cd0bf108d6f4d37'
            '5478e5a98666c41de828fb7f50c3ea53b05755b7bda7d11211c6b1406d3046ba')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 0755 "${pkgdir}/usr/lib/pocket-casts/chrome-sandbox"
}