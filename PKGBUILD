# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-gfx-bin'
pkgver=4.8.0
pkgrel=1
pkgdesc="ToneLib GFX – the perfect custom tone with a complete guitar studio in your computer!"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/gfx-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://www.tonelib.net/download/ToneLib-GFX-amd64.deb")
sha256sums=('97573923a9b43741f00b53966a327a39523918eff9b5bbfb3e1e427fb49f5c97')

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

