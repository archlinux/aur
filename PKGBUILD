#Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=rabbitvcs-caja
pkgver=0.16
pkgrel=1
pkgdesc="Caja front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
depends=('caja' 'python2-caja' 'dbus-python>=0.80' "rabbitvcs>=${pkgver}")
license=('GPL')
source=(https://github.com/rabbitvcs/rabbitvcs/archive/v${pkgver}.tar.gz)
md5sums=('25376cff136ad2fac901ff88e07893ef')

package(){
  cd ${srcdir}/rabbitvcs-${pkgver}
  mkdir -p $pkgdir/usr/share/caja-python/extensions

  sed -i '1i #!/usr/bin/env python2' clients/caja/RabbitVCS.py
  cp clients/caja/RabbitVCS.py $pkgdir/usr/share/caja-python/extensions
}
