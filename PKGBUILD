# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=eclipse-pydev
pkgver=13.1.0
pkgrel=1
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
depends=('java-runtime>=17' 'eclipse>=4.6' 'python>=3.8')
# Note: for the "eclipse-*" packages without "provides=('eclipse=X.YY')"
# declaration, please edit the "depends" line above manually.
makedepends=('unzip')
conflicts=('eclipse-aptana')
options=('!strip')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
sha1sums=('4bf0c5c022dadf2b9dc8cf2ef7d54f25b77e3f26')

package() {
  _dest="${pkgdir}/usr/lib/eclipse/dropins/pydev"
  cd "$srcdir"
  mkdir -p "${_dest}"
  cp -r {features,plugins} "$_dest/"
  find "${_dest}" -type d -exec chmod 755 {} \;
  find "${_dest}" -type f -exec chmod 644 {} \;
}
