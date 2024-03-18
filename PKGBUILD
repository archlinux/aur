pkgname='tonelib-tube-warmth-bin'
pkgver=1.4.0
pkgrel=1
pkgdesc="ToneLib Tube Warmth – The vibrancy and warmth of the tube along with the digital precision and clarity"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tl-tubewarmth.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-TubeWarmth-amd64.deb")
sha256sums=('635b02c780f344c913597f3b7237eada47914b3543624c90add87b37333ba273')

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
