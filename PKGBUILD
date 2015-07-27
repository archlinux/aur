# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail.com>
# Contributor: Dan Serban
# Contributors: Henri HÃ¤kkinenv, Damian Barberon, Netanel Shine, Simon Schneider
# Contributor: Lari Tikkanen <lartza at wippies.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='joomla'
pkgver='3.4.3'
pkgrel='1'
pkgdesc='A PHP-based content management platform'
arch=('any')
url='http://www.joomla.org/'
#_watch=('http://www.joomla.org/download.html',' ([\d.]*) Full Package')
license=('GPL')
depends=('php')
source=("http://joomlacode.org/gf/download/frsrelease/20086/162538/Joomla_${pkgver}-Stable-Full_Package.tar.bz2")
sha256sums=('a7aecfba6d9f753ca5307361fae478fb2736d84f4085e33d9dc6b64c1ff613b7')
install='joomla.install'

package() {
  set -u
  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -pr "${srcdir}" "${pkgdir}/usr/share/webapps/joomla"
  find "${pkgdir}/usr/share/webapps/joomla" -type f -exec chmod 0664 {} \;
  find "${pkgdir}/usr/share/webapps/joomla" -type d -exec chmod 0775 {} \;
  chown -R 'root:root' "${pkgdir}/usr/share/webapps/joomla"
  install -D 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
