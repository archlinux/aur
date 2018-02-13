# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=openupgradelib
pkgname=python2-${_pipname}
pkgver=1.3.2
pkgrel=1
pkgdesc="A library with support functions to be called from Odoo migration scripts."
arch=("any")
url="https://github.com/OCA/openupgradelib"
license=("BSD")
depends=("python")
makedepends=("python-pip")

build() {
  pip install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python2.7/site-packages/
}

