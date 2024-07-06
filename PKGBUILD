# Maintainer: Versua7 <versua7@gmail.com>

pkgname='tonelib-easycomp-bin'
pkgver=2.0.0
pkgrel=1
pkgdesc="ToneLib Easy Compressor – Powerful yet simple tool for quick compression"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/plugins/tl-easycomp.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-EasyComp-amd64.deb")
sha256sums=('bc606bb95f1bdea275bcd81efc7b563ee62e2df62cb37bd265f0facd7287dcca')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-easycomp/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
