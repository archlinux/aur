# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
pkgver=2.0.1
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
conflicts=(python-cadquery-git)
depends=(python python-ocp python-ezdxf)
checkdepends=(python-pytest)
source=("https://github.com/CadQuery/cadquery/archive/${pkgver}.tar.gz")
sha256sums=('7e126628a3928af42f9a86f2f0efd3ea2b143f9f9c14603a26ac76c25d1596b1')

build() {
  cd cadquery-${pkgver}
  python setup.py build
}

check() {
  cd cadquery-${pkgver}
  pytest -v --cov
}

package() {
  cd cadquery-${pkgver}
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build
}
