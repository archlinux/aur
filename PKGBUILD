# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>
_pipname=odoorpc
pkgname=python-${_pipname}
pkgver=0.6.0
pkgrel=1
pkgdesc="Python module providing an easy way to pilot your Odoo servers through RPC."
arch=("any")
url="https://github.com/OCA/odoorpc"
license=("LGPL3")
depends=("python")
makedepends=("python-pip")

build() {
  pip install --no-deps --target="${_pipname}" ${_pipname}==${pkgver}
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python3.6/site-packages/
}

