# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=3.0.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
)
sha512sums=('e7b72350876475e0b5b9b8c8c953aa380f5f25dade25785d15c5004a6866bb614c3ca2a3b34f84989013e350f9e73d339ce8ddd7d36766d80a981cfbfda7d1c6')


build() {
	cd $srcdir/$pkgname-$pkgver

	qmake PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make install INSTALL_ROOT="${pkgdir}"
}
