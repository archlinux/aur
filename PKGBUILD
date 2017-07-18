# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-controller
pkgver=3.4.0
pkgrel=1
pkgdesc='Manages headless Interactive Brokers IB Gateway instances'
arch=('any')
url="https://github.com/ib-controller/ib-controller"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

backup=('etc/ibcontroller/fdemo.ini'
        'etc/ibcontroller/edemo.ini')
source=('https://github.com/ib-controller/ib-controller/releases/download/3.4.0/IBController-3.4.0.zip'
	'fdemo.ini'
	'edemo.ini'
  	'ibcontroller@.service')
md5sums=('4e91b8df02123842aef9f211c5e0a4ff'
         '15f1ba10df1fa29068630eeea9e72bfa'
         '2a8c16170d102c855778921cd0391c19'
         '30c6b2c0b4a976c8142a9db6abefeea4')


package() {
	install -Dm644 ${srcdir}/IBController.jar ${pkgdir}/usr/share/java/ibcontroller/ibcontroller.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
