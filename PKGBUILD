# Maintainer: Lukas Spies <lukas_dot_spies_at_web_dot_de>

pkgname=imgurqt
pkgrel=1
pkgver=1.0
githash=b0700cc79bb5b512b1f749bd396ab4dfa065ef8b
pkgdesc="Console application implementing basic commands of imgur.com APIv3"
arch=("i686" "x86_64")
url="http://photoqt.org/imgurqt"
conflicts=("imgurqt-git")
license=("GPL2")
depends=("qt5-base")
makedepends=("git" "cmake")
source=("https://gitlab.com/luspi/imgurqt/repository/archive.tar.gz?ref=v1.0")
md5sums=('e27c0ea4bc11a8f76281ca7d01a52ff7')

prepare() {
	cd "$srcdir/$pkgname-v$pkgver-$githash"
	cmake .
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver-$githash"
	install -D imgurqt $pkgdir/usr/bin/imgurqt
}
