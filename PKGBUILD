pkgname=fahviewer
pkgver=7.5.1
pkgrel=1
pkgdesc="A Folding@home 3D simulation viewer"
url="http://folding.stanford.edu/English/HomePage"
arch=('x86_64')
license=('GPL2')
depends=('glew' 'gtk2' 'freetype2' 'glut')
options=('!docs' '!libtool')

# Moronic server
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

source=(https://download.foldingathome.org/releases/public/release/fahviewer/debian-stable-64bit/v7.5/fahviewer_7.5.1-64bit-release.tar.bz2)
    md5sums=('4fc5b507291bfae95cdf89163a6dfbc6')


package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/opt/fah/
	cp -rf fahviewer_${pkgver}-64bit-release/backgrounds ${pkgdir}/opt/fah/

	install -d "${pkgdir}/usr/bin"
	install -D -m0755 ${srcdir}/fahviewer_${pkgver}-64bit-release/FAHViewer ${pkgdir}/opt/fah/FAHViewer
	ln -s "/opt/fah/FAHViewer" "${pkgdir}/usr/bin/FAHViewer"
}


