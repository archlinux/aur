# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='tonelib-metal-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc="ToneLib Metal – Guitar amp simulator targeted at metal players"
arch=('x86_64')
filename="ToneLib-Metal-amd64.deb"
license=('custom')
url="https://tonelib.net/tonelib-metal"
depends=('gtk3' 'glib2' 'desktop-file-utils' 'fribidi' 'pango')
optdepends=('jack: JACK output')
source=("https://www.tonelib.net/download/${filename}")
sha256sums=('c2d5c5a336016d2103d8bd43587cbc8c2f2f9ce852d994399413e5b50a61ce36')

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

