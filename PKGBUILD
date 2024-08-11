# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz93@gmail.com>
pkgname='python-dukpy'
pkgver=0.4.0
pkgrel=9
name=dukpy
pkgdesc="Python bindings for the duktape embeddable JavaScript engine"
arch=('x86_64')
url="https://github.com/amol-/dukpy"
license=('MIT')
depends=('python' 'python-mutf8')
makedepends=('python-setuptools')
source=("dukpy-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${name}-${pkgver}.tar.gz")

build() {
  cd dukpy-${pkgver}

  python setup.py build
}

package_python-dukpy() {
  cd dukpy-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-dukpy/LICENSE"
}

sha256sums=('677ec7102d1c1c511f7ef918078e8099778dbcea7caf3d6a2a2a72f72aa2d135')
