# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=oclint-bin
_pkgname=oclint
pkgver=0.10.2
_distrosuffix="3.13.0-48-generic"
pkgrel=1
pkgdesc="A static code analysis tool for improving quality and reducing defects"
arch=(x86_64)
url="http://oclint.org/"
license=('custom')
depends=('python2')
provides=('oclint')
conflicts=('oclint')
source=(https://github.com/oclint/oclint/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux-$_distrosuffix.tar.gz)
sha256sums=('570aee9698f2f730ea75e01b4916f80e566551ab441681177ca561e146b3238b')

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
