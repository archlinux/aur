# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-nilearn
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=('any')
url="http://nilearn.github.io/"
license=('BSD')
depends=('python-coverage' 'python-nose' 'python-joblib' 'python-scipy' 'python-numpy' 'python-scikit-learn>=0.19' 'python-nibabel>=2.0.2')
makedepends=('python-setuptools')
optdepends=('python-matplotlib: Plotting library for fancy examples')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nilearn/nilearn/archive/${pkgver}.tar.gz")
sha256sums=('3d0e65bf0af8ca0ed9dc1bbd7d68675286b1891d4ed0863ea7f0e16f5f4d5115')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}

