# Maintainer: j605
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=1.1.0
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="http://jupyter.org"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/1d/49/f173b8697f9868059739055c27f4263dcbcc2060669249b5e4d62765b3e5/$_pkgname-$pkgver.tar.gz")
sha256sums=(80032f75d2a9a4b23bb1a0cd6411a68ced8c33b8a63d9ab7cfbb9c47ab3dde61)

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
}
