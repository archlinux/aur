# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgname=berry
pkgbase=berry-rel
pkgver=0.0.5
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
	'fe0732f047e5f0be043b456407e7a95aa8bce2597e1af781d63d8f756ba60885'
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
