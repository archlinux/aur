# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-controller
pkgver=3.2.0
pkgrel=2
pkgdesc='Manages headless Interactive Brokers IB Gateway instances'
arch=('any')
url="https://github.com/ib-controller/ib-controller"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

source=('https://github.com/ib-controller/ib-controller/releases/download/3.2.0/IBController-3.2.0.zip'
	'fdemo.ini'
	'edemo.ini'
	'ibcontroller@.service')
md5sums=('109bb4ae3adc8b640e8b245b149fc87f'
         '15f1ba10df1fa29068630eeea9e72bfa'
         '2a8c16170d102c855778921cd0391c19'
         '5eb11c510ae04ebc0617c29ac378c786')


package() {
	install -Dm644 ${srcdir}/IBController.jar ${pkgdir}/usr/share/java/ibcontroller/ibcontroller.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
