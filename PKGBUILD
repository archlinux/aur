# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=live-radio-app-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="An Electron application with React and TypeScript.Streaming norwegian live radio"
arch=('x86_64')
url="https://github.com/JesperBry/live-radio-app"
license=('custom')
conflits=("${pkgname%-bin}")
depends=('nss' 'gcc-libs' 'glibc' 'pango' 'libdrm' 'alsa-lib' 'libcups' 'hicolor-icon-theme' 'libxfixes' 'cairo' 'libxdamage' \
    'nspr' 'at-spi2-core' 'libxcb' 'libxcomposite' 'libxrandr' 'mesa' 'expat' 'libxext' 'gtk3' 'dbus' 'libxkbcommon' 'libx11' 'glib2')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/radio-app_${pkgver}_amd64.deb")
sha256sums=('1454aaaa2bac0e6c8167bc570884165ae68602df10c2ba2b966ef0fc560307da')
      
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Live radio/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}