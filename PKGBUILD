# Maintainer: freaknils <nils@czserver.de>

_pkgname=roundcube-rcmcarddav
pkgname="${_pkgname}-git"
pkgver=20151119
pkgrel=1
pkgdesc="This plugin allows users to export their contacts via CardDAV"
arch=('any')
conflicts=('roundcube-carddav')
url="http://www.benjamin-schieder.de/carddav.html"
license=('GPL')
depends=('roundcubemail>=0.9.0')
source=("$pkgname::git+https://github.com/blind-coder/rcmcarddav.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins/carddav
  install -dm755 ${_instdir}

  cp -r . "${_instdir}/"

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;
} 
