
# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
#
pkgname=osticket
pkgver=1.11.0rc1
_pkgver=1.11.0-rc1
pkgrel=1
pkgdesc='A widely-used open source support ticket system.'
arch=('any')
url='http://www.osticket.com/'
license=('GPL')
depends=('php' 'php-apache' 'mariadb')
makedepends=('unzip')
install="${pkgname}.install"
source=("https://github.com/osTicket/osTicket/releases/download/v$_pkgver/osTicket-v$_pkgver.zip")
sha256sums=('5b2599d91ae4d05eb0422713a96396af86ed4d87411334c4e07186a7dae30182')

package() {
  install -d ${pkgdir}/usr/share/webapps/osticket
  sleep 1
  echo "Extracting files"
  sleep 1
  unzip -d ${pkgdir}/usr/share/webapps/osticket "osTicket-v$_pkgver"

  # fix permissions (probably needs to get included upstream)
  find ${pkgdir}/usr/share/webapps/$pkgname -type f -exec chmod 0664 {} \; 
  find ${pkgdir}/usr/share/webapps/$pkgname -type d -exec chmod 0775 {} \; 
}
