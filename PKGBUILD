# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-svg.path
pkgver=4.1
pkgrel=3
pkgdesc="SVG path objects and parser"
url="https://github.com/regebro/svg.path"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
arch=(any)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/regebro/svg.path/archive/${pkgver}.tar.gz)
sha512sums=('fb302c65f85bd61d98baab9e2a9707bc82f1bf02f3c9a34e5b864dcc7d2e03f85bd26a4fadd91a4249dbc37ae13f57eb5cdfc2805cbcb4f693d6f5c8863a3e92')

build() {
  cd "svg.path-${pkgver}"
  python setup.py build
}

check() {
  cd "svg.path-${pkgver}"
  python setup.py test
}

package() {
  cd "svg.path-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
