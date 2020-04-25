# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=fahviewer-beta
pkgver=7.6.12
pkgrel=1
pkgdesc="A Folding@home 3D simulation viewer"
url="https://foldingathome.org/"
arch=('x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut' 'foldingathome-beta')
options=('!docs' '!libtool')
conflicts=('fahviewer')
provides=('fahviewer')
source=(https://download.foldingathome.org/releases/beta/release/fahviewer/debian-stable-64bit/v7.6/fahviewer_${pkgver}-64bit-release.tar.bz2)
sha256sums=('e16bfbfad6671a4912b6b84ba6e051a68223b81721bc6b8300ccb7c9b7d16596')

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


