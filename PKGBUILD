# Maintainer: "Jameson Pugh <imntreal@gmail.com>"
# Contributor: tang francescoallara.it

pkgname=roundcube-carddav
pkgver=0.5
pkgrel=2
pkgdesc="This plugin allows users to export their contacts via CardDAV"
arch=('any')
url="http://www.graviox.de/"
license=('GPL')
depends=('roundcubemail>=0.9.0')
source=("https://github.com/christian-putzke/Roundcube-CardDAV/archive/v${pkgver}.tar.gz")
sha256sums=('32e339ecb9c0338dff217529574aada997601cf5fa460769571cca8bd70d8242')

package() {
  cd "${srcdir}/Roundcube-CardDAV-${pkgver}"
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins/carddav
  install -dm755 ${_instdir}

  cp -r . "${_instdir}/"

  # fix all the 644 perms on files
  find ${_instdir} -type f -exec chmod 644 {} \;
}

