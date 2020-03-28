# Maintainer: j605
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=2.0.0
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="http://jupyter.org"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama)
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/92/84/6358505bef11c164fce3b747b4193ec9d9617cb2db9bb6c60c9f6d30109c/$_pkgname-$pkgver.tar.gz")
sha256sums=(896f79a23557f190b73a3981fdceb128a2d24454701daef74d82aac2aa10715d)

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.md
}
