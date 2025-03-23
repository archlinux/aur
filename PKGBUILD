# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=wmectrl
pkgver=0.2.3
pkgrel=1
pkgdesc="An enhanced window manager control"
url="http://www.muflone.com/wmectrl"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('libwnck3' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7baed5851d016a3c36b8d29152978eec14a7bf85b397c576cf4fd553f58cd3e2')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
