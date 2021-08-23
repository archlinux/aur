# Maintainer: RRRRRm <isxiongzj@gmail.com>
pkgname=beslyric-for-x-git
pkgver=v3.1.2.r177.g27a7e7d
pkgrel=1
pkgdesc="An easy and practical lyrics production software for Netease Cloud Music."
arch=('i686' 'x86_64')
url="https://github.com/Beslyric-for-X/Beslyric-for-X"
license=('GPL')
depends=('qt5-base' 'ffmpeg' 'sdl2' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/BesLyric-for-X/BesLyric-for-X.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake Beslyric-for-X.pro
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
