# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
pkgname=jid3-bzr
pkgver=r9
pkgrel=1
pkgdesc="Java library for manipulating ID3v1 and v2 tags on MP3 files."
arch=('any')
url="https://code.launchpad.net/~eythian/+junk/jid3"
license=('LGPL')
depends=('java-runtime')
makedepends=('bzr' 'java-environment')
source=('bzr+lp:~eythian/+junk/jid3')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-bzr}"
	printf "r%s" "$(bzr revno)"
}

build() {
	cd "$srcdir/${pkgname%-bzr}"
	ant jar
}

package() {
	install -Dm644 "$srcdir/jid3/dist/JID3.jar" "$pkgdir/usr/share/java/${pkgname%-bzr}/JID3.jar"
}
