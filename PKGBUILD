# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=ib-controller
pkgver=3.6.0
pkgrel=1
pkgdesc='Manages headless Interactive Brokers IB Gateway instances (IBC fork)'
arch=('any')
url="https://github.com/IbcAlpha/IBC"
license=('GPL3')
depends=(ib-tws xorg-server-xvfb xorg-server gtk2 libxrender libxtst gsettings-desktop-schemas ttf-dejavu)

backup=('etc/ibcontroller/fdemo.ini'
        'etc/ibcontroller/edemo.ini')
source=('https://github.com/IbcAlpha/IBC/releases/download/3.6.0/IBCLinux-3.6.0.zip'
        'https://github.com/IbcAlpha/IBC/raw/master/resources/IBC.jar'
        'fdemo.ini'
        'edemo.ini'
        'ibcontroller@.service')
md5sums=('055c4fab1a8ceeb9c70cca9e2fb43eda'
         'c9d9756004a08358b3861b591900f782'
         '981aa279128e5638f649ca9e7ab23011'
         '547d187f535c8230a2d4cff4d2d899f2'
         'cb2808018dba2880b2b4882d81fe8ac2')


package() {
	install -Dm644 ${srcdir}/IBC.jar ${pkgdir}/usr/share/java/ibcontroller/IBC.jar
	install -Dm600 ${srcdir}/fdemo.ini ${pkgdir}/etc/ibcontroller/fdemo.ini
	install -Dm600 ${srcdir}/edemo.ini ${pkgdir}/etc/ibcontroller/edemo.ini
	install -Dm644 ${srcdir}/ibcontroller@.service ${pkgdir}/usr/lib/systemd/system/ibcontroller@.service
}
