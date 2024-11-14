# Contributor: Bastien "neitsab" Traverse <neitsab@archlinux.org>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Asuka Minato
pkgname=openai-translator-bin
_srcname=open-ai-translator
pkgver=0.4.33
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API"
arch=("x86_64")
url="https://github.com/openai-translator/openai-translator"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
depends=(
        'webkit2gtk-4.1'
        'xdotool'
	# namcap implicitly satisfied deps:
	# glibc libsoup3 gtk3 hicolor-icon-theme libxcb openssl gdk-pixbuf2 glib2 gcc-libs
	# cairo pango
)
optdepends=('java-runtime: for OCR functionalities')
source=("${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_amd64.deb")
sha256sums=('dd6c0828cd5d33d55fe61297b5496ad8d7c14eb7ae73084f781567323f8cf0b1')

package() {
	bsdtar -C "$pkgdir" -xf "$srcdir/data.tar.gz" usr/
}
