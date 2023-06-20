# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tjmc-launcher-bin"
_appname="TJMC-Launcher"
pkgver=0.1.1008
pkgrel=1
pkgdesc="A simple to use, extremely fast, and well supported app, that allows you to install pure and modded versions of Java Minecraft."
arch=('aarch64' 'x86_64')
url="https://launcher.tjmc.ru/"
_githuburl="https://github.com/tjmcraft/TJMC-Launcher"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libxfixes' 'hicolor-icon-theme' 'nss' 'alsa-lib' 'cairo' 'libxrandr' 'at-spi2-core' 'glibc' 'gtk3' 'mesa' 'nspr' 'dbus' \
    'libdrm' 'libx11' 'pango' 'glib2' 'libcups' 'libxcomposite' 'libxdamage' 'libxext' 'libxcb' 'libxkbcommon' 'expat' 'gcc-libs')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-setup-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-setup-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/tjmcraft/TJMC-Launcher/main/LICENSE")
sha256sums=('1a25e3b0f4bf16543e5f802cf6d9d189bcae27617ca8be936ad866a8955d9ce6')
sha256sums_aarch64=('06c85c1638ffe2284587c37bc4426f5fb4bbdd8a4b057f2fc8e7b389b045bdb9')
sha256sums_x86_64=('274c6ad9ab731c2fd3eeb939cc02761753b7eea765141a2dba09f94b7ac42a79')
    
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}