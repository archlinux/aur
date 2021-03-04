# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cq-editor
pkgver=0.2
pkgrel=1
pkgdesc="CadQuery GUI editor based on spyder"
arch=('x86_64')
url="https://github.com/CadQuery/CQ-editor"
license=('Apache 2.0')
depends=(
python-cadquery
python-pyqt5
python-qtconsole
python-logbook
python-pyparsing
python-pyqtgraph
python-path.py
python-requests
spyder
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CadQuery/CQ-editor/archive/${pkgver}.tar.gz")
sha256sums=('4acb02a6b73d3098570da0eb73419728318a08f73b17079b88230f109ee91489')

build() {
  cd CQ-editor-${pkgver}
  python setup.py build
}

package() {
  cd CQ-editor-${pkgver}
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 --skip-build
}
