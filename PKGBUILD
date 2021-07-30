# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-nilearn
pkgver=0.8.0
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
sha256sums=('21d5b190e92f75c061680f8688e18b5a16eb537856fd9d22be7aff11261fdee7')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}

