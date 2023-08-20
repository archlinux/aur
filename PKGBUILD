# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=media-hoarder-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="The media frontend for data hoarders and movie lovers"
arch=('x86_64')
url="https://github.com/theMK2k/Media-Hoarder"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('dbus' 'hicolor-icon-theme' 'glib2' 'cairo' 'expat' 'libx11' 'libxshmfence' 'pango' 'mesa' 'nss' 'libxext' 'libxcomposite' \
    'gcc-libs' 'at-spi2-core' 'libxcb' 'alsa-lib' 'glibc' 'gtk3' 'libxrandr' 'libxkbcommon' 'libdrm' 'libcups' 'gdk-pixbuf2' \
    'libxdamage' 'nspr' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb"
    "LICENSE::https://raw.githubusercontent.com/theMK2k/Media-Hoarder/master/LICENSE.md")
sha256sums=('995a7266ded2c472bad49f9a8edb3fb445639704a849c8f78ed4df217b511bd6'
            '3c67fce0428a3d133bb589cd1db329789ec235049af1412511f89420c99ae9a6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}