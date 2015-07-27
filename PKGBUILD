# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail.com>
# Contributor: Dan Serban
# Contributors: Henri HÃ¤kkinenv, Damian Barberon, Netanel Shine, Simon Schneider
# Contributor: Lari Tikkanen <lartza at wippies.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='joomla'
pkgver='3.4.1'
pkgrel='1'
pkgdesc='A PHP-based content management platform'
arch=('any')
url='http://www.joomla.org/'
_watch=('http://www.joomla.org/download.html',' ([\d.]*) Full Package')
license=('GPL')
depends=('php')
source=("http://joomlacode.org/gf/download/frsrelease/20021/162258/Joomla_${pkgver}-Stable-Full_Package.zip")
sha256sums=('ec6a17242e9f5bd1e0388a590ddaa31c2bde0f36254f3cc90e3f95f170ab6cba')
install='joomla.install'

package() {
  set -u
  #rm "Joomla_3.4.1-Stable-Full_Package.zip"
  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -pr "${srcdir}" "${pkgdir}/usr/share/webapps/joomla"
  find "${pkgdir}/usr/share/webapps/joomla" -type f -exec chmod 0664 {} \;
  find "${pkgdir}/usr/share/webapps/joomla" -type d -exec chmod 0775 {} \;
  chown -R root:root "${pkgdir}/usr/share/webapps/joomla"
  install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
