# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=tailman
pkgver=0.1.2
pkgrel=1
pkgdesc="Remote tail log viewer"
arch=('any')
url="https://github.com/martinhjartmyr/tailman"
license=('GPL3')
depends=('libssh' 'qt4')
source=('vcs-repository::git://github.com/martinhjartmyr/tailman.git#tag='$pkgver)
md5sums=('SKIP')

build() {
	cd "$srcdir/vcs-repository"
	qmake-qt4
	make
}

package() {
	install -Dm 755 $srcdir/vcs-repository/tailman $pkgdir/usr/bin/tailman
	install -Dm 644 $srcdir/vcs-repository/images/network.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm 644 $srcdir/vcs-repository/tailman.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
