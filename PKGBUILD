# Maintainer: olivierlm < mail at olivierlemoal dot fr >

pkgname=tonelib-zoom-bin
pkgver=4.3.1
pkgrel=1
pkgdesc="ToneLib Zoom – change and save all the settings in your Zoom(r) guitar pedal"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/zoom-quick-start/"
depends=('webkit2gtk')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/ToneLib-Zoom-amd64.deb")
sha256sums=('e2adaf334feaee8fc5ada7273b6c719ebdbba29a9f550a0dedfb2a4c3f53aff7')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-zoom/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

post_remove() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

