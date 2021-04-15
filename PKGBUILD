# Maintainer: Shaharyar Ahmed <shaharyar.ahmed1121@gmail.com>
pkgname=cell
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="cell is a command line text editor like vim"
arch=(x86_64)
url="https://gitlab.com/ShaharyarAhmed-bot/cell"
license=('GPL')
depends=()
makedepends=(qt5-base git gcc make)
source=("git+$url")
md5sums=('SKIP')


build() {
        cd "cell"
        qmake -makefile
	make
}

package() {
	cd "cell"
        install -Dm755 ./bin/cell "$pkgdir/usr/bin/cell"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
