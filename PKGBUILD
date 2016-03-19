# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=emoncms
pkgver=9.4
pkgrel=1
pkgdesc="an open-source web application for processing, logging and visualising energy, temperature and other environmental data"
url="https://emoncms.org"
arch=('any')
license=('GPL3')
depends=('php' 'mariadb' 'php-apache' 'php-mcrypt')
install=${pkgname}.install
source=("https://github.com/emoncms/emoncms/archive/${pkgver}.tar.gz" "apache.example.conf")
md5sums=('15fd82752dc05044bb69d8f9f127bf6b'
         '4172492bf03807dd44d4fcc0c8cdaa0c')

options=(!strip emptydirs)

package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/$pkgname-$pkgver/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a ${srcdir}/$pkgname-$pkgver "${pkgdir}/usr/share/webapps/$pkgname"
  
  install -m644 -D ${srcdir}/apache.example.conf -t ${pkgdir}/etc/webapps/$pkgname
}

# vim:set ts=2 sw=2 et:
