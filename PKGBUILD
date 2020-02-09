# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-gfx-bin'
pkgver=4.3.0
pkgrel=2
pkgdesc="ToneLib GFX – the perfect custom tone with a complete guitar studio in your computer!"
arch=('x86_64')
filename="ToneLib-GFX-amd64.deb"
license=('custom')
url="https://tonelib.net/gfx-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/${filename}")
sha256sums=('63af62a56b6dca3de73a91c7c0e5320aecc31c2bd588491114144b26d208b7e1')

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

