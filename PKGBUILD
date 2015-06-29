# Maintainer Stefan Tatschner <stefan@sevenbyte.org>

pkgname=roundcube-rcmcarddav
pkgver=1.0.0
pkgrel=3
pkgdesc="CardDAV plugin for RoundCube Webmailer"
arch=('any')
url="https://github.com/blind-coder/rcmcarddav"
license=('GPL')
depends=('roundcubemail')
backup=('etc/webapps/roundcubemail/plugins/carddav/config.inc.php')
source=("https://github.com/blind-coder/rcmcarddav/archive/carddav_${pkgver}.tar.gz")
md5sums=('38a0246d0ed90d6f5ccb39bf09d08afd')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/roundcubemail/plugins
  mkdir -p ${pkgdir}/etc/webapps/roundcubemail/plugins/carddav

  cd ${pkgdir}/usr/share/webapps/roundcubemail/plugins
  cp -ra ${srcdir}/rcmcarddav-carddav_${pkgver} carddav

  cd carddav
  cp config.inc.php.dist ${pkgdir}/etc/webapps/roundcubemail/plugins/carddav/config.inc.php
  ln -s /etc/webapps/roundcubemail/plugins/carddav/config.inc.php config.inc.php
}
