# Maintainer: Versua7 <versua7@gmail.com>

pkgname='tonelib-noise-reducer-bin'
pkgver=1.5.0
pkgrel=1
pkgdesc="ToneLib Noise Reducer – Powerful, yet simple two-unit rack effect on guard of your mix clarity."
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tl-noisereducer.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-NoiseReducer-amd64.deb")
sha256sums=('5cc1094bf9bd39f83c7c3eb7a6b06801c084f05d2a369b02bc330723811f6cbd')

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
