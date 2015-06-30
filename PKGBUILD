# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thorsten Lanfer <tlanfer@gmail.com>
pkgname=openhab-addons
pkgver=1.7.0
pkgrel=1
pkgdesc="openHAB automation addons"
arch=('any')
url="http://www.openhab.org/"
license=('EPL')
depends=('java-runtime>=7'
				 'openhab-runtime=1.7.0')
makedepends=('unzip')
optdepends=()
backup=()
source=("https://bintray.com/artifact/download/openhab/bin/distribution-$pkgver-addons.zip")
noextract=("distribution-$pkgver-addons.zip")
md5sums=('e2340abbb14fc6c22e0d884a431dc5de')

prepare() {
	mkdir "$srcdir/$pkgname"
	cd "$srcdir/$pkgname"

	unzip "$srcdir/distribution-$pkgver-addons.zip"

}

package() {
	cd $pkgdir
	mkdir -p opt
	cp -r $srcdir/openhab-addons opt
}
