# Maintainer: Jack Wu <origincoder@yahoo.com>
pkgname=bilibili-live-helper
entryname="Bilibili Live Helper"
pkgver=1.1.2
pkgrel=1
pkgdesc="A Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=('cairo' 'libxtst' 'libxi' 'gtk2' 'libxrandr' 'pango' 'fontconfig' 'libxss' 'gdk-pixbuf2' 'nss' 'freetype2' 'nspr' 'gconf' 'libxext' 'libxdamage' 'atk' 'libxrender' 'libxcomposite' 'libxcursor' 'libxfixes' 'libx11' 'alsa-lib' 'libcups')
makedepends=('tar')
conflicts=('bilibili-live-helper-git')
provides=('bilibili-live-helper')
source=('git+https://github.com/OriginCode/AURFiles' "${entryname}.desktop")
md5sums=('SKIP' 'SKIP')

build() {
	cd "$srcdir/AURFiles"
	tar xvf ./${pkgname}.tar.gz
}

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/share/applications"
	cp -r ${srcdir}/AURFiles/${pkgname}/* "${pkgdir}/opt/${pkgname}"
	cp ./"${entryname}.desktop" "${pkgdir}/usr/share/applications/${entryname}.desktop"
}
