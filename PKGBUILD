# Maintainer: olivierlm < mail at olivierlemoal dot fr >

pkgname=tonelib-zoom-bin
pkgver=4.0.1
pkgrel=1
pkgdesc="ToneLib Zoom – change and save all the settings in your Zoom(r) guitar pedal"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/zoom-quick-start/"
depends=('webkit2gtk')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/ToneLib-Zoom-amd64.deb")
sha256sums=('44eec33f0f3b34621e1d9929509d061f7aa49dafcf39c2f73b31b2d0fcad9b74')

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

