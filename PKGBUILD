# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nxshell-bin"
pkgver=1.9.3
pkgrel=2
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=()
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('at-spi2-core' 'alsa-lib' 'nodejs' 'gtk3' 'nss' 'python' 'gdk-pixbuf2' 'dbus' 'expat' 'libcups' 'libxcomposite' 'libx11' 'cairo' 'libxdamage' \
    'glibc' 'gcc-libs' 'pango' 'mesa' 'hicolor-icon-theme' 'libxcb' 'nspr' 'libxrandr' 'libdrm' 'libxfixes' 'libxkbcommon' 'glib2' 'libxext' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/NxShell-amd64-linux-${pkgver}-202303220832.deb"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('3f32cfb803930aee09660dad0aa156beabb8f910b76fdaca6ebfb25ed5d2d6be'
            '5f6da76746b239458fc480805f2e761e4d95b023169b99bb2c333e5bbc125fb7')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}