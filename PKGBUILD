pkgname='tonelib-noise-reducer-bin'
pkgver=1.4.0
pkgrel=1
pkgdesc="ToneLib Noise Reducer – Powerful, yet simple two-unit rack effect on guard of your mix clarity."
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tl-noisereducer.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-NoiseReducer-amd64.deb")
sha256sums=('02999c47b24d6853b078f8a29744180e2a775fc32512fd43cc3e6d77bae3f2b0')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/toneLib-noisereducer/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
