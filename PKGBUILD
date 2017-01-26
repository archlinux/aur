# Maintainer: Yarema aka Knedlyk <yupadmin (at) gmail (dot) com>

pkgname=ddrescue-gui
pkgver=1.6.1
pkgrel=3
pkgdesc="A simple GUI frontend to make ddrescue (a command-line data recovery tool) easier to use."
arch=('any')
url="https://launchpad.net/ddrescue-gui"
depends=('python2' 'wxpython' 'ddrescue' 'parted' 'lshw' 'python2-beautifulsoup4')
license=('GPL3')
source=(https://launchpad.net/ddrescue-gui/1.x/${pkgver}/+download/ddrescue-gui_${pkgver}%7Eotherdistro-0ubuntu1%7Eppa1.tar.gz)
provides=('ddrescue-gui')
package() {

	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" *.py
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" */*.py
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps

	cp -r "${srcdir}/${pkgname}-${pkgver}/images" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/other" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/Tools" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/GetDevInfo" "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/*.py "${pkgdir}/usr/share/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.desktop" "${pkgdir}/usr/share/applications"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.png" "${pkgdir}/usr/share/pixmaps"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/${pkgname}"
}
md5sums=('61b14975e5648a8b76332e655b1ea00e')
