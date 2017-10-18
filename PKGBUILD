# Maintainer: Eric Griffis <dedbox at gmail dot com>
pkgname=twinejs-standalone
pkgver=2.1.3
pkgrel=2
pkgdesc="an open-source tool for telling interactive, nonlinear stories"
arch=('x86_64')
url="http://twinery.org/"
license=('GPL3')
source=("https://bitbucket.org/klembot/twinejs/downloads/twine_${pkgver}_linux64.zip"
        "http://twinery.org/homepage/img/logo.svg"
        "twinejs.desktop")
md5sums=('1ff968c4a9697ca0f0988917f2be889b'
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
