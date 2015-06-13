# Contributor: SanskritFritz (gmail)

pkgname=lis.to
_pkgname=listo
pkgver=0.9.7.36
pkgrel=3
pkgdesc="A task manager for mobilistas. Unique organisation scheme, the power of tags with the simplicity of folders."
arch=('any')
url="http://code.google.com/p/listo/"
license=('GPL')
depends=(java-runtime)
makedepends=(unzip)
source=(http://$_pkgname.googlecode.com/files/$_pkgname.$pkgver.jar.zip  $_pkgname.sh $_pkgname.desktop)
md5sums=('90e305d34cfa2642c01ca2a7ed4621c1'
         '53091d842ee778fd7dc7770f246f00bc'
         '64322dac513a48b8a240b45848a14f33')

build() {
	cd "$srcdir"
	yes | unzip listo.jar images/logo.png
}

package() {
	cd "$srcdir"

	install -Dm644 $_pkgname.jar "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
	install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 images/logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

