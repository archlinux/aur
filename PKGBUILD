# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=yellowbrick
pkgbase=python-yellowbrick
pkgname=('python-yellowbrick')
pkgver=1.2.1
pkgrel=1
pkgdesc="A suite of visual analysis and diagnostic tools for machine learning"
arch=('any')
url='https://github.com/DistrictDataLabs/yellowbrick'
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scipy' 'python-matplotlib'
         'python-scikit-learn' 'python-cycler')
optdepends=(
  'python-umap-learn: UMAP Corpus Visualization with UMAPVisualizer/umap'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c0c07485fb5cf933e1e708895bfb1bbaa87401090172584d25327e62adbfe49')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  rm -rf tests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
