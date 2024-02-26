# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Asuka Minato
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.3.25
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
sha256sums=('c10f6b88f5a7fd3692ed015f402c0a11750b081eb8918372bc52aff85fb75935')

package() {
	cd "$srcdir/"
	tar -xvf data.tar.gz
	install -d ${pkgdir}/usr/
	cp -r $srcdir/usr/* ${pkgdir}/usr/
}
