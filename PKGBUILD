pkgname=cweather
pkgbase=cweather
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple weather utility written in C - read the source code for more info"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cjson' 'curl')
optdepends=('nerd-fonts: for the expanded icon set')
provides=('cweather')
source=("git+https://github.com/raptor8134/cweather.git")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgbase}
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cd ${srcdir}/${pkgbase}
	make DESTDIR="${pkgdir}/" install
}
