# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=oclint-bin
_pkgname=oclint
pkgver=0.8.1
_pkgverminor=0.8
_distrosuffix="3.13.0-35-generic"
pkgrel=1
pkgdesc="A static code analysis tool for improving quality and reducing defects"
arch=(x86_64)
url="http://oclint.org/"
license=('custom')
depends=('python2')
provides=('oclint')
conflicts=('oclint')
source=(http://archives.oclint.org/releases/$_pkgverminor/$_pkgname-$pkgver-x86_64-linux-$_distrosuffix.tar.gz)
sha256sums=('f74c19a55cba53174419c3cfb64c9f62673986d72507c80b3ef1b6e8bf3317f3')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i "1s/python/python2/" bin/oclint-json-compilation-database
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir "$pkgdir/usr/"
	cp -r bin/ "$pkgdir/usr/"
	cp -r lib/ "$pkgdir/usr/"
	mkdir -p "$pkgdir/usr/share/licenses/oclint"
	cp LICENSE "$pkgdir/usr/share/licenses/oclint"
}
