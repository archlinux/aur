# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=open-ai-translator-bin
pkgver=0.0.72
pkgrel=1
pkgdesc="基于 ChatGPT API 的划词翻译浏览器插件和跨平台桌面端应用 - Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=('x86_64')
url="https://github.com/openai-translator/openai-translator"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "openai-translator")
depends=('hicolor-icon-theme' 'glibc' 'dbus' 'glib2' 'gcc-libs' 'xdotool' 'gtk3' 'cairo' 'gdk-pixbuf2' \
	'libx11' 'libxtst' 'java-runtime' 'pango' 'webkit2gtk' 'openssl')
source=("${pkgname%-appimage}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('78425a21d3bd1939d9b7b4fda4d167a5138858b162cbd2a33b59e4a19a84bdf7')
prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
	cp -r "${srcdir}/usr" "${pkgdir}"
}