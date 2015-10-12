#Mantainer: Simone Esposito <webmaster at freebnc.net>

pkgname=aria2fe
pkgver=0.0.5
pkgrel=6
pkgdesc="A GUI for the CLI-based aria2 download utility"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/aria2fe/"
license=("GPL3")
depends=('qt4' 'aria2' 'xterm')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2 ${pkgname}.desktop)
md5sums=('caa4ca05dce2702de28fb8afbd34c722'
         '36082a7cfd77b33c5b8c8ac968b52b74')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/src
	qmake-qt4
	make 
}

package() {
        install -d ${pkgdir}/usr/{bin,share/{pixmaps,applications}}
	install -Dm 755 ${srcdir}/${pkgname}-${pkgver}/bin/aria2fe ${pkgdir}/usr/bin/
	install -D ${srcdir}/${pkgname}-${pkgver}/src/pixmaps/download_32x32.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
