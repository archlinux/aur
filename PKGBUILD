# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Asuka Minato
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.3.40
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
sha256sums=('7bea0c6bd0c9bef0cb3b5425694b1021b27ab9124b796d2ee783485ec4610c90')

package() {
	cd "$srcdir/"
	tar -xvf data.tar.gz
	install -d ${pkgdir}/usr/
	cp -r $srcdir/usr/* ${pkgdir}/usr/
}
