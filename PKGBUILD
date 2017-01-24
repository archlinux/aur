# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=eclipse-pydev
pkgver=5.4.0
pkgrel=2
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
depends=('java-environment>=7' 'eclipse>=3.8')
makedepends=('unzip')
conflicts=('eclipse-aptana')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
sha1sums=('b53bc44b7ddc0e52751a0b85120d6c2ce09b8475')

package() {

  _dest="${pkgdir}/usr/lib/eclipse/dropins/pydev"

  cd "$srcdir"
  mkdir -p "${_dest}"

  cp -r {features,plugins} "$_dest/"

  find "${_dest}" -type d -exec chmod 755 {} \;
  find "${_dest}" -type f -exec chmod 644 {} \;
}
