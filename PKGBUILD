# Maintainer Justin Vreeland <vreeland.justin@gmail.com>
# Based off PKGBUILD in altos by Bob Finch
pkgname=freetts
pkgver=1.2.2
pkgrel=1
pkgdesc="Sun's rewrite of filte for java"
makedepends=('junit' 'apache-ant' 'java-runtime-common')
arch=('any')
license=('custom')
# Source forge is a pain and I trust bdale
source=("http://http.debian.net/debian/pool/main/f/freetts/freetts_${pkgver}.orig.tar.gz")
url="http://freetts.sourceforge.net/"
md5sums=('89c9a6b15dcd53d1e62469f95d9fc93f')

build() {
	cd $srcdir/$pkgname-$pkgver
	ln -sf . src
	ant
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -d $pkgdir/usr/share/java/$pkgname/lib
	install -m644 lib/* $pkgdir/usr/share/java/$pkgname/lib/
}

