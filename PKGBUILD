# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=spiderweb
pkgver=24.01
pkgrel=1
pkgdesc="System for Processing Image Data from Electron microscopy and Related fields"
arch=(x86_64)
url="https://spider.wadsworth.org"
license=('GPL')
depends=('openmotif' 'lib32-libxext' 'lib32-libsm' 'python2' 'tcsh')
makedepends=()
optdepends=()
source=("https://spider.wadsworth.org/spider_doc/spider/download/spiderweb.${pkgver}.tar.gz" 'spiderweb.sh' 'spiderweb.csh')
md5sums=('6611f5e596d94d4e217693b0df6ce4dd' 'SKIP' 'SKIP')
build() {
	cd "${srcdir}"/
	echo "Register at https://spider.wadsworth.org/spider_doc/spider/docs/spi-register.html"
	echo "If SPIDER is useful, please cite: Frank J, Radermacher M, Penczek P, Zhu J, Li Y, Ladjadj M,  Leith A. SPIDER and WEB: Processing and visualization of images in 3D electron microscopy and related fields.  J. Struct. Biol. 1996; 116: 190-199."
}	
package() {
	install -d "${pkgdir}"/opt "${pkgdir}"/etc/profile.d/ "${pkgdir}"/usr/bin/
	cp -r "${srcdir}"/spider "${pkgdir}"/opt/.
	cp -r "${srcdir}"/web "${pkgdir}"/opt/.
	install -D -m755 spiderweb.sh "${pkgdir}"/etc/profile.d/.
	install -D -m755 spiderweb.csh "${pkgdir}"/etc/profile.d/.
        ln -s /opt/web/bin/web_linux_tru64 "${pkgdir}"/usr/bin/web
}
