# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-nilearn
pkgver=0.9.2
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
sha256sums=('04b6ab91326c1e8ae260406cb8c1c4f8a56627c64d1aaeb5321a13be35dc2a18')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}

