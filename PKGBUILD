# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="google-docs-bin"
pkgver=2022.12.1
pkgrel=1
pkgdesc="Google Docs Desktop App made with electron. Includes Google Docs, Sheets, Slides, Forms, and Drive."
arch=("x86_64")
url="https://complabs.in/apps/google-docs"
_githuburl="https://github.com/Comp-Labs/Google-Docs"
license=('MIT')
depends=('pango' 'at-spi2-core' 'nspr' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr' 'gcc-libs' 'nss' 'libxext' \
    'libxcb' 'libdrm' 'libx11' 'glibc' 'libcups' 'glib2' 'dbus' 'libxfixes' 'mesa' 'alsa-lib' 'expat' 'gtk3' 'hicolor-icon-theme' 'cairo' 'wayland')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Google-Docs-linux-amd64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Comp-Labs/Google-Docs/main/LICENSE")
sha256sums=('ec35d80b9189ddfa095b108fc939490e0d2ef682036a82e7807679ae0b3a49d4'
            'cd44ddffb7c00b09fa102c9ce08213cda2af5fedb070e01d5975fd41665551c7')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}