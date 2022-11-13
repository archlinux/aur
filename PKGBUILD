# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pixelcolor
pkgver=0.2.0
pkgrel=1
pkgdesc="Get the screen pixel color"
url="http://www.muflone.com/pixelcolor"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-pillow')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('780d287ea74c020ba3691732ed13c74748d98f7e0d89bc472ec2984ebcf59033')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

