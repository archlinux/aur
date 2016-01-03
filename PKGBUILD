# Maintainer: SanskritFritz (gmail)

pkgname=erebus
pkgver=0.15
pkgrel=1
pkgdesc="2D real-time role-playing game."
arch=('i686' 'x86_64')
url="http://erebusrpg.sourceforge.net/"
license=("GPLv3")
depends=('sfml')
makedepends=('qt4')
source=("$pkgname-$pkgver::http://launchpad.net/erebus/trunk/$pkgver/+download/erebussrc.zip"
        "erebus.sh")

build() {
	cd "$srcdir/erebussrc"
	qmake-qt4 erebus.pro
	make
}

package() {
	cd "$srcdir/erebussrc"
	make INSTALL_ROOT="$pkgdir" install
	mkdir --parents $pkgdir/usr/bin
	install -Dm755 "$srcdir/erebus.sh" "$pkgdir/usr/bin/erebus"
}

md5sums=('2beca3a679f904d57d24a65ae445a3d5'
         '408c07f7ccb7c8cb95e3c59a319c17e9')
