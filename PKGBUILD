# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=fahviewer-beta
pkgver=7.4.17
pkgrel=3
pkgdesc="A Folding@home 3D simulation viewer"
url="http://folding.stanford.edu/"
arch=('x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut' 'foldingathome-beta')
options=('!docs' '!libtool')
conflicts=('fahviewer')
provides=('fahviewer')
source=(https://download.foldingathome.org/releases/beta/release/fahviewer/debian-stable-64bit/v7.4/fahviewer_${pkgver}-64bit-release.tar.bz2)
sha256sums=('58788a48fbe8e81d34ac15dfe0d058047d41815587f1f74ed3595a81fd4c1242')

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


