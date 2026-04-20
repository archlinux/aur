# Maintainer: Jacob Alexander Tice <jacob.a.tice@gmail.com>

pkgname='tonelib-detuner-bin'
pkgver=1.1.0
pkgrel=1
pkgdesc="ToneLib Detuner – Flexible and Simple Tool for High-quality Pitch Shifting"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/plugins/tl-detuner.html"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'alsa-lib' 'harfbuzz' 'fribidi' 'pango' 'freetype2')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://tonelib.net/download/ToneLib-Detuner-amd64.deb")
sha256sums=('5a0e48a8276736670679f87c7cf740c4c2a268a873fdebee71979a07e2e969e6')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-detuner/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}
