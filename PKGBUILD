pkgname=qastrocam-g2
pkgver=4.9.1
pkgrel=1
pkgdesc="Linux modified webcam capture software for astronomy."
url="http://sourceforge.net/projects/qastrocam-g2/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('qt3' 'libjpeg-turbo' 'cfitsio' 'libusb' 'avifile')
optdepends=('sdl')
makedepends=('gcc')
source=('http://sourceforge.net/projects/qastrocam-g2/files/Releases/qastrocam-g2_4.9.1_src.tar.gz')
sha1sums=('61dc1566405ef031ce3708f66b20f58873f789bf')

build() {
	cd "${srcdir}/${pkgname}"
	make configure-generic QT_MT=-mt QT_BASE=/opt/qt CFITSIO_BASE=/usr
	make all
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/usr" install
}

