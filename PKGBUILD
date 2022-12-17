# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-metal-bin'
pkgver=1.2.5
pkgrel=2
pkgdesc="ToneLib Metal – Guitar amp simulator targeted at metal players"
arch=('x86_64')
license=('custom')
url="https://tonelib.net/tonelib-metal"
depends=('alsa-lib' 'desktop-file-utils' 'freetype2' 'hicolor-icon-theme' 'mesa')
optdepends=('jack: JACK output')
source=("${pkgname}-${pkgver}.deb::https://www.tonelib.net/download/ToneLib-Metal-amd64.deb")
sha256sums=('73a2d98d2127d134baf282c15dd353c87d2bd92e0899d7feb2080b14618012f4')

package () {
    tar xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/usr/share/doc/tonelib-metal/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
	update-desktop-database -q
}

