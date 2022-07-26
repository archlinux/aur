# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=python-steamgriddb
pkgver=1.0.4
pkgrel=1
pkgdesc="Python API wrapper for SteamGridDB.com"
arch=(any)
url="https://github.com/ZebcoWeb/python-steamgriddb"
license=(MIT)
depends=(python-requests)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZebcoWeb/python-steamgriddb/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd11e46e030892c77bfa252f72e60db030e1266a34c6c530f8608c0eb725a36f')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
