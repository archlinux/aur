# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pennywise-bin
pkgver=0.8.0
pkgrel=3
pkgdesc="Cross-platform application to open any website or media in a floating window"
arch=('i686' 'x86_64')
url="https://github.com/kamranahmedse/pennywise"
license=('MIT')
depends=('gtk3' 'util-linux-libs' 'libxrandr' 'libxcursor' 'pango' 'libxi' 'hicolor-icon-theme' 'nspr' 'libxext' 'libxss' 'gdk-pixbuf2' \
	'libxdamage' 'libxrender' 'cairo' 'alsa-lib' 'libxtst' 'libxcb' 'dbus' 'libxfixes' 'libx11' 'at-spi2-core' 'gcc-libs' 'expat' 'glib2' \
	'libcups' 'nss' 'libxcomposite' 'glibc')
optdepends=('chromium: for Open with Pennywise Chrome extension'
			'google-chrome: for Open with Pennywise Chrome Extension'
			'firefox: for Open with Pennywise Firefox Add-on'
			'pepper-flash: for Adobe Flash support in Chromium'
			'flashplugin: for Adobe Flash support in Firefox')
conflicts=("${pkgname%-bin}")
source_i686=("${pkgname%-bin}-${pkgver}-i386.deb::${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE.md::https://raw.githubusercontent.com/kamranahmedse/pennywise/master/license.md")
sha256sums=('b41ccd76edcf9e9af64581622b1d6dc1de7ed55a96548c4af8c43d32cd764b0b')
sha256sums_i686=('df794adfb3fd28cb68beabe59cadfc000c0b20c83bb38f064d9409a7951b6799')
sha256sums_x86_64=('02d5f5ea3bf0b934d650cbb75c3cb43ab62b3d1c48c733b2f85816ccc8736191')

package() {
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}