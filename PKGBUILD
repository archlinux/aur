# Maintainer: j605
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=1.0.1
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="http://jupyter.org"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/98/b5/9a58d559046f78fad52ff943b6b4a58467be7ec6b3b07939a94eacf04e50/$_pkgname-$pkgver.tar.gz")
sha256sums=(4ea28aa05d2e3c38298c33c24fb39902991f8961fe4166ce2f09ee0460568dd9)

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
}
