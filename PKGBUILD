# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=eclipse-pydev
pkgver=10.1.3
pkgrel=1
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
# after moving Eclipse to AUR (why?) there is a mess with a bunch of packages.
# this one is for "eclipse-platform" and other packages which uses correct
# "provides=eclipse" option.
depends=('java-environment>=11' 'eclipse>=4.6')
# for "eclipse-common/etc/etc" uncomment the next line.
#depends=('java-environment>=8' 'eclipse-common>=4.6')
makedepends=('unzip')
conflicts=('eclipse-aptana')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
sha1sums=('61af60bb99ac44e6ee31c9e3ff4a161da9b0267c')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/pydev"
  cd "$srcdir"
  mkdir -p "${_dest}"
  cp -r {features,plugins} "$_dest/"
  find "${_dest}" -type d -exec chmod 755 {} \;
  find "${_dest}" -type f -exec chmod 644 {} \;
}
