# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-jam-bin'
pkgver=4.3.3
pkgrel=1
pkgdesc="ToneLib Jam – the learning and practice software for guitar players"
arch=('x86_64')
filename="ToneLib-Jam-amd64.deb"
license=('custom')
url="https://tonelib.net/jam-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/${filename}")
sha256sums=('4c05b2c1fbfc0f4b8a9d314d91af67b511befd7e500074fea10f2953d59b47d4')

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

