# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Asuka Minato
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.0.89
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=("x86_64")
url="https://github.com/yetone/openai-translator"
license=('MIT')
provides=("openai-translator")
conflicts=("openai-translator-git" "openai-translator")
depends=('webkit2gtk' 'xdotool' 'libayatana-appindicator'
	glibc libx11 gtk3 dbus hicolor-icon-theme openssl pango glib2 gcc-libs
	java-runtime
	libxtst
	cairo
	gdk-pixbuf2
)
source=(
	"https://github.com/yetone/openai-translator/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.deb"
)
sha256sums=('92ccd14283e4766b5a519c37bd8e2ae0ce656b1d38ede3cb02d48881272ddb85')

package() {
	cd "$srcdir/"
	tar -xvf data.tar.gz
	install -d ${pkgdir}/usr/
	cp -r $srcdir/usr/* ${pkgdir}/usr/
}
