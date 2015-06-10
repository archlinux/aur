# Maintainer: Ben Alex <ben.alex@acegi.com.au>

# Using GitHub as upstream URL instead of IBController, as GitHub has lots of docs on usage to assist users.

pkgname=ib-controller
pkgver=2.12
pkgrel=3
pkgdesc='Manages headless Interactive Brokers IB Gateway instances'
arch=('any')
url="https://github.com/benalexau/ibcontroller-aur"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

source=('https://github.com/ib-controller/ib-controller/releases/download/2.12.2/IBController-2.12.2.zip'
	'fdemo.ini'
	'edemo.ini'
	'ibcontroller@.service')
md5sums=('71cf5d83257a454f3157d64cbeb49f59'
         '8e8a058f3cecc490db9b1a5368624b06'
         '77d02d9b5cbcd1ad3f37d116f1f217e1'
         '2ce6f7efe6ce6f38c1ad8d9e5e1cc7ae')


package() {
	install -Dm644 ${srcdir}/IBController/IBController.jar ${pkgdir}/usr/share/java/ibcontroller/ibcontroller.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
