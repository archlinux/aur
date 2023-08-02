# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="calmly-writer-bin"
pkgver=2.0.54
pkgrel=1
pkgdesc="Calmly Writer is an editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=('aarch64' 'x86_64')
url="https://www.calmlywriter.com"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'glibc' 'libxrandr' 'libxfixes' 'libxkbcommon' 'lib32-gcc-libs' 'pango' \
    'libdrm' 'libcups' 'gdk-pixbuf2' 'alsa-lib' 'at-spi2-core' 'libx11' 'libxdamage' \
    'nspr' 'libxcb' 'nss' 'dbus' 'hicolor-icon-theme' 'libxext' 'libxcomposite' 'mesa' \
    'gcc-libs' 'glib2' 'lib32-glibc' 'expat' 'cairo' 'sh')
options=()
source_aarch64=("${pkgname%-bin}_${pkgver}-aarch64.deb::${url}/releases/linux/deb/arm64/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}_${pkgver}-x86_64.deb::${url}/releases/linux/deb/x64/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE.html::${url}/eula.htm")
sha256sums=('79f277c107ca3402d156db2ced6ea619a966216097c8d4d17692bada193b3edb')
sha256sums_aarch64=('dd7606298580fbf26c3882cdf83286db563680c9ef757cdceba6a605d8bbf11e')
sha256sums_x86_64=('91432bec316b83ef3a0e47815c4db9ec38903704e19c61e29f32782f327a3897')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}