# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=wmectrl
pkgver=0.2.0
pkgrel=1
pkgdesc="An enhanced window manager control"
url="http://www.muflone.com/wmectrl"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('libwnck3' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('55eb054bc182e4f75fe344bfc667da89d4d2945c60f8693c9b6d0504fd970094')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
