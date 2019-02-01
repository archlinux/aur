#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=socnetv
_reponame=app
pkgver=2.4
pkgrel=1
pkgdesc="Social Networks Analysis and Visualisation"
arch=('any')
url="http://socnetv.sourceforge.net/"
license=('GPL3')
depends=('qt5-base')
provides=('socnetv')
conflicts=('socnetv-git')
source=(https://github.com/$pkgname/app/archive/v$pkgver.tar.gz)
sha256sums=('de1ba2b76b356aa8fe90744241797374cffdafa79685bdbd619f5357ad97bca9')

build() {
	cd "${srcdir}/$_reponame-$pkgver"
	qmake-qt5
	make
}

package() {

	cd "${srcdir}/$_reponame-$pkgver"
	install -d "$pkgdir/usr/share/socnetv/"
	install -D socnetv "$pkgdir/usr/bin/socnetv"
	install -D socnetv.desktop "$pkgdir/usr/share/applications/socnetv.desktop"
	install -D "src/images/socnetv.png" "$pkgdir/usr/share/pixmaps/socnetv.png"
	install -D "man/socnetv.1.gz" "$pkgdir/usr/share/man/man1/socnetv.1.gz"

	cp -r translations/ "$pkgdir/usr/share/socnetv/"
}
