# Maintainer: achterin

pkgname=roundcube-contextmenu-plugin
pkgver=2.1.2
pkgrel=1
pkgdesc="This plugin adds context menus to the message list, folder list and address book."
arch=('any')
url="http://www.tehinterweb.co.uk/roundcube/#picontextmenu"
license=('GPL')
depends=('roundcubemail>=1.1.0')
source=(https://github.com/JohnDoh/Roundcube-Plugin-Context-Menu/archive/2.1.2.tar.gz)
md5sums=('fdda9008c9c0de15ce0156b37258c087')

package() {
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins
  install -dm755 ${_instdir}
  cp -r ${srcdir}/Roundcube-Plugin-Context-Menu-${pkgver} ${_instdir}/contextmenu

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;
}
