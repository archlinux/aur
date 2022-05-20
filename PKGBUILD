pkgname='tonelib-tube-warmth-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc="ToneLib Tube Warmth – The vibrancy and warmth of the tube along with the digital precision and clarity"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/index.html#freeware_section"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-TubeWarmth-amd64.deb")
sha256sums=('28e396a849c616c78880961623ecd8cf2c57bb808e9c3465d13cbf4ef049487d')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-tubewarmth/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
