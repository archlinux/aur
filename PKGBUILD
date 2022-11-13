# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pixelcolor-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Get the screen pixel color"
url="http://www.muflone.com/pixelcolor"
arch=('any')
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-pillow')
conflicts=('pixelcolor')
provides=('pixelcolor')
source=("git+https://github.com/muflone/${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${pkgname%-*}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-*}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

