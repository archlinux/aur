#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=socnetv
pkgver=2.0
pkgrel=1
pkgdesc="Social Networks Analysis and Visualisation"
arch=('any')
url="http://socnetv.sourceforge.net/"
license=('GPL3')
depends=('qt5-base')
provides=('socnetv')
conflicts=('socnetv-git')
source=(http://downloads.sourceforge.net/socnetv/SocNetV-$pkgver.tar.gz)
sha256sums=('6c1029df89471a1ea086e9fcd74f968f859c19c4faada8ff389dff0d5d7e7833')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"

	install -d "$pkgdir/usr/share/socnetv/"
	install -D socnetv "$pkgdir/usr/bin/socnetv"
	install -D socnetv.desktop "$pkgdir/usr/share/applications/socnetv.desktop"
	install -D "src/images/socnetv.png" "$pkgdir/usr/share/pixmaps/socnetv.png"
	install -D "man/socnetv.1.gz" "$pkgdir/usr/share/man/man1/socnetv.1.gz"

	cp -r translations/ "$pkgdir/usr/share/socnetv/"
}
