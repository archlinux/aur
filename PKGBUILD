# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-controller
pkgver=3.4.3
pkgrel=0
pkgdesc='Manages headless Interactive Brokers IB Gateway instances'
arch=('any')
url="https://github.com/ib-controller/ib-controller"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

backup=('etc/ibcontroller/fdemo.ini'
        'etc/ibcontroller/edemo.ini')
source=('https://github.com/ib-controller/ib-controller/releases/download/3.4.0/IBController-3.4.0.zip'
        'https://github.com/ib-controller/ib-controller/raw/master/resources/IBController.jar'
	'fdemo.ini'
	'edemo.ini'
  	'ibcontroller@.service')
md5sums=('4e91b8df02123842aef9f211c5e0a4ff'
         '7e1c811c0f6bb1bdc7e98ca77d8676bf'
         '15f1ba10df1fa29068630eeea9e72bfa'
         '2a8c16170d102c855778921cd0391c19'
         'f1038408283433b18a5cb39b30019fe6')


package() {
	install -Dm644 ${srcdir}/IBController.jar ${pkgdir}/usr/share/java/ibcontroller/ibcontroller.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
