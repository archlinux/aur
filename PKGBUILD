# Maintainer: Isaac Ross <isaacwross@gmail.com>
pkgname=ballandpaddle
pkgver=0.8.1
pkgrel=1
pkgdesc="Breakout clone from the GNU project"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/ballandpaddle/"
license=('GPL3')
depends=('sdl>=1.2' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'guile1.8')
source=("http://ftp.gnu.org/gnu/ballandpaddle/$pkgname-$pkgver.tar.gz")
sha256sums=("de82d17ab032e9a997eb0537820053d6a84661b283df1be7724756d054f3f77d")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
