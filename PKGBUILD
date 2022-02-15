# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-jam-bin'
pkgver=4.7.5
pkgrel=1
pkgdesc="ToneLib Jam – the learning and practice software for guitar players"
arch=('x86_64')
_filename="ToneLib-Jam-amd64.deb"
license=('custom')
url="https://tonelib.net/jam-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/${_filename}")
sha256sums=('6a591da0484de7ca3d20667cb01dfd72d4e9a2e3129af827ead6eb2859de28f2')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-jam/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

