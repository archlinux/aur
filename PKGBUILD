pkgname='tonelib-bass-drive-bin'
pkgver=1.2.0
pkgrel=1
pkgdesc="ToneLib Bass Drive – Full power of the legendary drive pedal for the highest string gauges"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tl-bassdrive.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-BassDrive-amd64.deb")
sha256sums=('764e13b30e5deadc78110c8eb02e6cdffdc796b1f486bee08ba3822e9554df08')

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
