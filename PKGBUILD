#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=socnetv
_reponame=app
pkgver=2.2
pkgrel=1
pkgdesc="Social Networks Analysis and Visualisation"
arch=('any')
url="http://socnetv.sourceforge.net/"
license=('GPL3')
depends=('qt5-base')
provides=('socnetv')
conflicts=('socnetv-git')
source=(https://github.com/$pkgname/app/archive/v$pkgver.tar.gz)
sha256sums=('d060e1debdd1caa37f69e17f79aefe74689bc4103ad61d6a8aab81ff67d39785')

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
