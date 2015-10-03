## PKGBUILD
# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: Mark Doe <mark.doe.priv@gmail.com>
##
#
pkgname=osticket
pkgver=1.9.12
pkgrel=1
pkgdesc='A widely-used open source support ticket system.'
arch=('any')
url='http://www.osticket.com/'
license=('GPL')
depends=('php>=4.3.10' 'php-apache>=4.3.10' 'mysql>=4.4.0')
makedepends=('unzip')
install="${pkgname}.install"
source=("http://osticket.com/sites/default/files/download/osTicket-v$pkgver.zip")
md5sums=('bdadf4f1e0bb050e64663f6227c9bf1c')

package() {
  install -d ${pkgdir}/srv/http/osticket
  sleep 1
  echo "Extracting files"
  sleep 1
  unzip -d ${pkgdir}/srv/http/osticket "osTicket-v$pkgver"

  # fix permissions (probably needs to get included upstream)
  find ${pkgdir}/srv/http/$pkgname -type f -exec chmod 0664 {} \; 
  find ${pkgdir}/srv/http/$pkgname -type d -exec chmod 0775 {} \; 
}
