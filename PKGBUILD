# Maintainer: olivierlm < mail at olivierlemoal dot fr >

pkgname=tonelib-zoom-bin
pkgver=4.0.1
pkgrel=2
pkgdesc="ToneLib Zoom – change and save all the settings in your Zoom(r) guitar pedal"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/zoom-quick-start/"
depends=('webkit2gtk')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/ToneLib-Zoom-amd64.deb")
sha256sums=('e59252ce93d096b33af724a993784265266c2a23987d1ceec69be7a1dff05a20')

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

