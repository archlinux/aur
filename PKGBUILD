# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calmly-writer-bin"
pkgver=2.0.52
pkgrel=3
pkgdesc="Calmly Writer is an editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=('x86_64')
url="https://www.calmlywriter.com"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'glibc' 'libxrandr' 'libxfixes' 'libxkbcommon' 'lib32-gcc-libs' 'pango' \
    'libdrm' 'libcups' 'gdk-pixbuf2' 'alsa-lib' 'at-spi2-core' 'libx11' 'libxdamage' \
    'nspr' 'libxcb' 'nss' 'dbus' 'hicolor-icon-theme' 'libxext' 'libxcomposite' 'mesa' \
    'gcc-libs' 'glib2' 'lib32-glibc' 'expat' 'cairo' 'sh')
options=()
source=("${pkgname%-bin}_${pkgver}.deb::${url}/releases/linux/deb/x64/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.html::${url}/eula.htm")
sha256sums=('45d223301278c81479e5483372805ce409c53c4c1412975312990ee39e6c031a'
            '57ca9932cc353e0734325a3e0377abc9645021c908a81a44446b2153ee19c6d9')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}