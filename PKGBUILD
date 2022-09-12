# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=3.3.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
)
sha512sums=('7e2a647fc4bb81e9784a0b05b3fdee3e6306767aebd32466f6451dc8b2e0f61e01a5657d0bfb8ba091bdd8365c9fed4fd2ab5cd2a27bf5403a5192d42472f7b2')


build() {
	cd $srcdir/$pkgname-$pkgver

	qmake PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make install INSTALL_ROOT="${pkgdir}"
}
