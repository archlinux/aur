# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pixelcolor
pkgver=0.1.0
pkgrel=1
pkgdesc="Get the screen pixel color"
url="http://www.muflone.com/pixelcolor"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-pillow')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('eff430932929edf4ec395f1e123427778d4e63a8a54898906e81b1980f6a8115')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

