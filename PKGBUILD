# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=1.2
pkgrel=1
pkgdesc="A suite of visual analysis and diagnostic tools for machine learning"
arch=('any')
url='http://www.scikit-yb.org'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy' 'python-matplotlib'
         'python-scikit-learn' 'python-cycler')
optdepends=(
  'python-umap-learn: UMAP Corpus Visualization with UMAPVisualizer/umap'
)
_pypi='https://files.pythonhosted.org/packages'
_path='b2/be/7b894da1794166579bf5194fa35ecc0170293691cdc22e076df47b444bc9'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")
sha256sums=('380b9775c9ad1880be55fab697a5d694823f9bc972bd7c2108553a11c7c8f252')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
