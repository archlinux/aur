# Maintainer: j605
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=1.0.5
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="http://jupyter.org"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/10/97/63e18d01ee2ec570c4440fb47f4e6b7b0e2c915e48ec838ebbd2fc013a82/$_pkgname-$pkgver.tar.gz")
sha256sums=(0928fb09bf384d2b66760d1fc29f6bdf1843770ab2cb2761fe5d296636222964)

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
}
