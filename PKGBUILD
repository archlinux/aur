# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=wmectrl
pkgver=0.2.1
pkgrel=1
pkgdesc="An enhanced window manager control"
url="http://www.muflone.com/wmectrl"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('libwnck3' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11157de66d8973fcbd72ae3a4dc1d409e69397627987a7b4dc78916bcd07e049')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
