# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Eli Schwartz <eschwartz93@gmail.com>
pkgname='python-dukpy'
pkgver=0.5.0
pkgrel=1
name=dukpy
pkgdesc="Simple JavaScript interpreter for Python"
arch=('x86_64' 'aarch64')
url="https://github.com/amol-/dukpy"
license=('MIT')
depends=('python')
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

sha256sums=('079fe2d65ac5e24df56806c6b4e1a26f92bb7f13dc764f4fb230a6746744c1ad')
