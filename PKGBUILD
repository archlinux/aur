# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=qdriverstation
pkgver=0.14
pkgrel=1
pkgdesc="Drive your FRC robot with your phone or tablet!"
arch=('i686' 'x86_64')
url="https://github.com/wint-3794/qdriverstation"
license=('MIT')
groups=()
depends=('sdl2' 'qt5-multimedia')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("https://github.com/WinT-3794/QDriverStation/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('371136d9ad505be4acf065caba019f25')

extractdir="QDriverStation-${pkgver}"

prepare() {
	cd "$srcdir/${extractdir}"
}

build() {
	cd "$srcdir/${extractdir}"
	qmake-qt5
	make
}

check() {
	cd "$srcdir/${extractdir}"
	make -k check
}

package() {
	cd "$srcdir/${extractdir}"
	make INSTALL_ROOT="$pkgdir/" install
}
