# Maintainer: archlinux.info:tdy

pkgbase=python-pyvbox
pkgname=(python2-pyvbox)
pkgver=1.0.0
pkgrel=1
pkgdesc="A Pythonic implementation of the VirtualBox Main API"
arch=(any)
url=https://github.com/mjdorma/pyvbox
license=(Apache)
depends=(virtualbox-sdk)
makedepends=(python2-setuptools)
source=(https://github.com/mjdorma/${pkgbase#*-}/archive/v$pkgver.tar.gz)
sha256sums=(b1349d7462e6427302bff3fba4df2cf1cced4b3a1baa5a697351295b177ee4b2)

build() {
  cd ${pkgbase#*-}-$pkgver
  python2 setup.py build
}

package_python2-pyvbox() {
  cd ${pkgbase#*-}-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
