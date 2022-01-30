# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-gfx-bin'
pkgver=4.7.3
pkgrel=1
pkgdesc="ToneLib GFX – the perfect custom tone with a complete guitar studio in your computer!"
arch=('x86_64')
_filename="ToneLib-GFX-amd64.deb"
license=('custom')
url="https://tonelib.net/gfx-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/${_filename}")
sha256sums=('68c27437ff0c3b2a13b66cd0d76f53946348befb434090227231f880df14a2ff')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-gfx/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

