# Maintainer: piernov <piernov@piernov.org>

pkgname=python-scikit-garden
pkgver=0.1.3
pkgrel=1
pkgdesc="A garden for scikit-learn compatible trees"
arch=('x86_64')
url="https://scikit-garden.github.io/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-scikit-learn' 'cython')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/63/0f/850592f6e8619d42086cdcc6a1731a4254f74db09878a155ab3d4cdc55ef/scikit-garden-${pkgver}.tar.gz)
sha512sums=('e6e7c2ca9378eeeec7c731577003d819f8b6c99e17004e1a363164212a3800b8a12c34ec53a501e0492f67c10f5260789fe9bd0a4e1a6b516613dbe96fe1bcb3')

build() {
  cd scikit-garden-$pkgver
  python setup.py build
}

package() {
  cd scikit-garden-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
