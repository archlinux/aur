# Maintainer: j605
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=2.1.0
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="http://jupyter.org"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama)
license=('BSD')
arch=('any')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/jupyter/nbdime/archive/$pkgver.tar.gz")
sha256sums=('c86826edcc7ceae28c4e9e57b091adf990be7a60bf7e6fadc1d173a3a94512e2')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
}
