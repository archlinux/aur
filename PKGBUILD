# Maintainer: Devon Wolfkiel <devonwolf at tutanota dot com>
# Contributor: Eric Griffis <dedbox at gmail dot com>

pkgname=twinejs-standalone
pkgver=2.3.0
pkgrel=3
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')
depends=('libxss'
	 'gconf'
	 'nss'
	 'gtk3')
source=("https://github.com/klembot/twinejs/releases/download/${pkgver}/twine_${pkgver}_linux64.zip"
        "http://twinery.org/homepage/img/logo.svg"
        "twinejs.desktop")
md5sums=('277e7790b4fc60bbf8e8cd0da13c1021'
         'c7119a1fb9d65014691b77778e5e5ec7'
         '71705539c71923a8464240a8cb3e567f')
options=(!strip)

prepare() {
	mv "twine_${pkgver}" "${pkgname}_${pkgver}_linux64"
}

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/opt"
        cp -r "${pkgname}_${pkgver}_linux64" "$pkgdir/opt"
	cp twinejs.desktop "$pkgdir/usr/share/applications"
	cp logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/twinejs.svg"
	ln -s "/opt/${pkgname}_${pkgver}_linux64/Twine" "$pkgdir/usr/bin/Twine"
}
