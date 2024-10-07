# Maintainer: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-jam-bin'
pkgver=4.8.5
pkgrel=1
pkgdesc="ToneLib Jam – the learning and practice software for guitar players"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/jam-overview/"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://www.tonelib.net/download/ToneLib-Jam-amd64.deb")
sha256sums=('b72d058b4a083dadcd06aa977c82da39f45dd112967cb7203a5c580e42f39a52')

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

