# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-controller
pkgver=3.0.1
pkgrel=1
pkgdesc='Manages headless Interactive Brokers IB Gateway instances'
arch=('any')
url="https://github.com/ib-controller/ib-controller"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

source=('https://github.com/ib-controller/ib-controller/releases/download/v3.0.1/IBController-3.0.1.zip'
	'fdemo.ini'
	'edemo.ini'
	'ibcontroller@.service')
md5sums=('7979230e9539daff8841e814741d56fb'
         '8e8a058f3cecc490db9b1a5368624b06'
         '77d02d9b5cbcd1ad3f37d116f1f217e1'
         '5eb11c510ae04ebc0617c29ac378c786')


package() {
	install -Dm644 ${srcdir}/IBController.jar ${pkgdir}/usr/share/java/ibcontroller/ibcontroller.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
