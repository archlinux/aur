# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: Rene Wiermer <rwiermer@googlemail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=qtads
pkgver=3.2.0
pkgrel=1
url="https://realnc.github.io/qtads/"
license=('GPL')
pkgdesc="interpreter for TADS games (compatible with TADS 2 and 3, multimedia and text)"
arch=('i686' 'x86_64')
depends=('qt5-base' 'fluidsynth' 'mpg123' 'libvorbis' 'hicolor-icon-theme' 'libsndfile')
source=(
	"https://github.com/realnc/qtads/releases/download/v${pkgver}/qtads-${pkgver}-source.tar.xz"
)
sha512sums=('db52ed092d676029cc1ff1d02ddf9e5a91e0bcd77fbfd8e43c923deea4413c452895b70835c519e234f8af0bddf61bad7ad3ec5209876335eacaabe63ed6390a')


build() {
	cd $srcdir/$pkgname-$pkgver

	qmake PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make install INSTALL_ROOT="${pkgdir}"
}
