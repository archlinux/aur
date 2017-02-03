# Maintainer: Lukas Spies <lukas_dot_spies_at_web_dot_de>

_pkgname=imgurqt
pkgname=imgurqt-git
pkgrel=1
pkgver=`date --iso-8601 | sed 's/-//g'`
pkgdesc="Console application implementing basic commands of imgur.com APIv3"
arch=("i686" "x86_64")
url="http://photoqt.org/imgurqt"
provides=("imgurqt")
license=("GPL2")
depends=("qt5-base")
makedepends=("git cmake")
source=("git+https://gitlab.com/luspi/imgurqt.git")
md5sums=("SKIP")

prepare() {
	cd "$srcdir/$_pkgname"
	cmake .
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -D imgurqt $pkgdir/usr/bin/imgurqt
}
