# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=python-whiteboard-git
pkgrel=1
pkgver=r251.61431aa
pkgdesc="Linux whiteboard in python."
arch=('i686' 'x86_64')
url="https://github.com/pnegre/python-whiteboard"
license=('GPLv2')
depends=('python-pybluez' 'python-pyqt4' 'python-numpy' 'python-xlib' 'python-future')
makedepends=('git')
conflicts=('python-whiteboard')
provides=('python-whiteboard')
source=("${pkgname}"::'git+https://github.com/pnegre/python-whiteboard')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make all
} 

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir" install
}
