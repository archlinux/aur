# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
pkgname=wrpn
pkgver=6.0.8
pkgrel=1
pkgdesc="Windows Reverse Polish Notation, a software clone of the HP-16C"
arch=(any)
url="http://www.wrpn.emmet-gray.com/"
license=('Public Domain')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
source=("WRPN_Java-6.0.8.zip::http://www.wrpn.emmet-gray.com/Files/WRPN_Java.zip"
		"wrpn.sh")
sha256sums=('d311c52e225b53f91801a38a58ae184e70e8c6efa03c15d92854160e848fbc82'
            '0e1e5221e864d43195c692b7151cbff184e2356e3cfbe8fd3f8821071cefe4bc')

build() {
	cd "WRPN/"
	ant
}

package() {
	mkdir -p "$pkgdir/usr/share/java/wrpn"
	install -m644 WRPN/dist/WRPN.jar "$pkgdir/usr/share/java/wrpn/WRPN.jar"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 wrpn.sh "$pkgdir/usr/bin/wrpn"
	mkdir -p "$pkgdir/usr/share/doc/wrpn"
	install -m644 WRPN/Readme.txt "$pkgdir/usr/share/doc/wrpn/"
	install -m644 "WRPN/Release Notes.txt" "$pkgdir/usr/share/doc/wrpn/Release-Notes.txt"
}

# vi: noet ts=4 sw=4
