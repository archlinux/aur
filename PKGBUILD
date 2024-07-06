# Maintainer: Versua7 <versua7@gmail.com>

pkgname='tonelib-tube-warmth-bin'
pkgver=1.5.0
pkgrel=1
pkgdesc="ToneLib Tube Warmth – The vibrancy and warmth of the tube along with the digital precision and clarity"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tl-tubewarmth.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-TubeWarmth-amd64.deb")
sha256sums=('5c19f26282c2204d21bd0b7dd4adc31eb8e6e12923ce0c05de0e05e4604a64b8')

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
