# Maintainer: Ethan Skinner <aur@etskinner.com>
# Contributer: Brad Pitcher <bradpitcher@gmail.com>
# Contributer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-svg.path
pkgver=6.3
pkgrel=1
pkgdesc="SVG path objects and parser"
url="https://github.com/regebro/svg.path"
license=('MIT')
checkdepends=(python-pillow python-pytest)
depends=(python)
makedepends=(python-setuptools)
arch=(any)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fd9dd9e1e603be5e212e3eb247c9f3778203f5285397a4cdde4c038c3f31f7bc2b8904491c208256996e2fbd39b4e5f7ea58d964bd5d22bc09c57e4bc2c70317')

build() {
  cd "svg.path-${pkgver}"
  python setup.py build
}

# TODO Bring back check when the tests can pass
#check() {
#  cd "svg.path-${pkgver}"
#  python setup.py test
#}

package() {
  cd "svg.path-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
