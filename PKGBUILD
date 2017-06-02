# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: paul2lv [at] gmail dot com

pkgname=fahviewer-beta
pkgver=7.4.16
pkgrel=2
pkgdesc="A Folding@home 3D simulation viewer"
url="http://folding.stanford.edu/"
arch=('x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut' 'foldingathome=7.4.16')
options=('!docs' '!libtool')
conflicts=('fahviewer')
provides=('fahviewer=7.4.16')
source=(https://folding.stanford.edu/releases/beta/release/fahviewer/debian-stable-64bit/v7.4/fahviewer_${pkgver}-64bit-release.tar.bz2)
sha256sums=('56bdc4f64451f5c1dc43cbc2332e044b7b4c2f3bd41b26f25b7c69b2a529ab1c')

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


