# Maintainer: Yarema aka Knedlyk <yupadmin (at) gmail (dot) com>

pkgname=ddrescue-gui
pkgver=1.6
pkgrel=1
pkgdesc="A simple GUI frontend to make ddrescue (a command-line data recovery tool) easier to use."
arch=('any')
url="https://launchpad.net/ddrescue-gui"
depends=('python2' 'wxpython2.8' 'ddrescue' 'parted' 'lshw' 'python2-beautifulsoup4')
license=('GPL3')
source=(#"https://launchpad.net/ddrescue-gui/1.x/${pkgver}/+download/${pkgname}_${pkgver}otherdistro-0ubuntu1%7Eppa1.tar.gz")
https://launchpad.net/ddrescue-gui/1.x/1.6.1/+download/ddrescue-gui_1.6.1%7Eotherdistro-0ubuntu1%7Eppa1.tar.gz)
provides=('ddrescue-gui')
package() {

	cd ${srcdir}/${pkgname}-${pkgver}.${pkgrel}
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" *.py
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" */*.py
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps

	cp -r "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/images" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/other" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/Tools" "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}.${pkgrel}/*.py "${pkgdir}/usr/share/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/ddrescue-gui.desktop" "${pkgdir}/usr/share/applications"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/ddrescue-gui.png" "${pkgdir}/usr/share/pixmaps"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}.${pkgrel}/LICENSE" "${pkgdir}/usr/share/${pkgname}"
}
md5sums=('61b14975e5648a8b76332e655b1ea00e')
