# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=wmectrl
pkgver=0.2.2
pkgrel=1
pkgdesc="An enhanced window manager control"
url="http://www.muflone.com/wmectrl"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('libwnck3' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('12496424634e7b79ca2e66da0557030ad3d101f7d4dc5d23075e00eacc6da99b')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
