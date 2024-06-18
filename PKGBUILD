# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Asuka Minato
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.4.20
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=("x86_64")
url="https://github.com/yetone/openai-translator"
license=('MIT')
provides=("openai-translator")
conflicts=("openai-translator-git" "openai-translator")
depends=('webkit2gtk' 'xdotool' 'libayatana-appindicator'
	glibc libx11 gtk3 dbus hicolor-icon-theme openssl pango glib2 gcc-libs
	libxtst
	cairo
	gdk-pixbuf2
)
source=(
	"https://github.com/yetone/openai-translator/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.deb"
)
sha256sums=('a580990b74e2349ee8e14f689b2f379b1e3f63943bd9ca6dd4f9d07dfbff4d8c')

package() {
	cd "$srcdir/"
	tar -xvf data.tar.gz
	install -d ${pkgdir}/usr/
	cp -r $srcdir/usr/* ${pkgdir}/usr/
}
