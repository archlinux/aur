# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgname=berry
pkgbase=berry-rel
pkgver=0.0.7
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=(
	"https://github.com/JLErvin/berry/archive/${pkgver}.tar.gz"
)
sha256sums=(
	'8ac594be059147bedf3e5624261c4954f803d8b0a59ed764c61d895e899f1a37'
)

# For later.
#install -D -m644 ../berry.desktop "${pkgdir}/usr/share/xsessions/"

build() {
	# Build the package.
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	# ...and install.
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	
	cd man/
	make DESTDIR="$pkgdir/" install
}
