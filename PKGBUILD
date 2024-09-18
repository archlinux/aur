# Maintainer: autumnontape <autumn at cyfox dot net>
# Contributor: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=3.4.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL-3.0-or-later')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'sdl2' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
)
sha512sums=('b4d40ec3f757803beeb7e22afa7b2ae6a612970c11615378ed145870d577e30b5734cd316c4739e4a3726917654e268034e6ecf1132ebbe1e120dc56aa9a2e3b')


build() {
	cd $srcdir/$pkgname-$pkgver

	qmake PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make install INSTALL_ROOT="${pkgdir}"
}
