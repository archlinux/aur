# Maintainer: Yarema aka Knedlyk <yupadmin (at) gmail (dot) com>

pkgname=ddrescue-gui
pkgver=1.4
pkgrel=1
pkgdesc="A simple GUI frontend to make gddrescue easier to use."
arch=('any')
url="https://launchpad.net/ddrescue-gui"
depends=('python2' 'wxpython2.8' 'ddrescue' 'parted')
license=('GPL3')
source=("https://launchpadlibrarian.net/213272261/${pkgname}_${pkgver}otherdistro-0ubuntu1~ppa1.tar.gz")
provides=('ddrescue-gui')
package() {

	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" *.py
	sed -i -e "s/\!\/usr\/bin\/env\ python/\!\/usr\/bin\/env\ python2/" */*.py
	mkdir -p ${pkgdir}/usr/share/${pkgname}
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp -r "${srcdir}/${pkgname}-${pkgver}/GetDevInfo" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/images" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/other" "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/${pkgname}-${pkgver}/Tools" "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 ${srcdir}/${pkgname}-${pkgver}/*.py "${pkgdir}/usr/share/${pkgname}"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.desktop" "${pkgdir}/usr/share/applications"
	install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.png" "${pkgdir}/usr/share/pixmaps"
}
md5sums=('c849699ea6271383b61de3719e3f31f6')
