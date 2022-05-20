pkgname='tonelib-bass-drive-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc="ToneLib Bass Drive – Full power of the legendary drive pedal for the highest string gauges"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/index.html#freeware_section"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-BassDrive-amd64.deb")
sha256sums=('df07312330a0b7749649d9c384ec5a9897ca2b8d0b99b56b94cc5b9de28a028b')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-bassdrive/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
