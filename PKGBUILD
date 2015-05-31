#Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
#Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=rabbitvcs-thunar
pkgver=0.16
pkgrel=1
pkgdesc="Thunar front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
depends=('thunar>=0.4.0' 'thunarx-python>=0.2.0' 'dbus-python>=0.80' "rabbitvcs>=${pkgver}")
license=('GPL')
source=(https://github.com/rabbitvcs/rabbitvcs/archive/v${pkgver}.tar.gz)
md5sums=('25376cff136ad2fac901ff88e07893ef')
package(){
  cd ${srcdir}/rabbitvcs-${pkgver}
  mkdir -p $pkgdir/usr/lib/thunarx-2/python
  mkdir -p $pkgdir/usr/lib/thunarx-1/python
  sed -i '1i #!/usr/bin/env python2' clients/thunar/RabbitVCS.py
  cp clients/thunar/RabbitVCS.py $pkgdir/usr/lib/thunarx-2/python
  cp clients/thunar/RabbitVCS.py $pkgdir/usr/lib/thunarx-1/python
}
