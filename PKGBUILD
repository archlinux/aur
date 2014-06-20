# Maintainer: Ian D. Scott <ian@perebruin.com>
pkgname=dsmidiwifi-cli
pkgver=1.0
pkgrel=1
pkgdesc="DSMI Server with GUI Removed"
url="http://github.com/ids1024/dsmidiwifi-cli"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt5-base' 'alsa-lib')
source=("https://github.com/ids1024/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2c652ebd4d05689621da1a934ee20cc8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 dsmidiwifi-cli $pkgdir/usr/bin/dsmidiwifi-cli
}

# vim:set ts=2 sw=2 et:
