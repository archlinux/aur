# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=eclipse-pydev
pkgver=6.5.0
pkgrel=1
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
depends=('java-environment>=8' 'eclipse>=4.6')
makedepends=('unzip')
conflicts=('eclipse-aptana')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
sha1sums=('4b1084b467a012513fe9aa26ef85df3ee3cd574f')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/pydev"
  cd "$srcdir"
  mkdir -p "${_dest}"
  cp -r {features,plugins} "$_dest/"
  find "${_dest}" -type d -exec chmod 755 {} \;
  find "${_dest}" -type f -exec chmod 644 {} \;
}
