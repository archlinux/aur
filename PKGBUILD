# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

_pkgname=berry
pkgname=berry-git
pkgbase=berry
pkgver=git+8d72619
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=(
	"git://github.com/JLErvin/berry.git#branch=master"
	berry.desktop
)
sha256sums=('SKIP' 'SKIP')

# For later.
#install -D -m644 ../berry.desktop "${pkgdir}/usr/share/xsessions/"

build() {
	cd ${_pkgname}/
	make
}

package() {
	cd ${_pkgname}/
	make DESTDIR="$pkgdir/" install
	
	cd man/
	make DESTDIR="$pkgdir/" install
}
										
