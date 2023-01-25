# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-nilearn
pkgver=0.10.0
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=('any')
url="http://nilearn.github.io/"
license=('BSD')
# see https://github.com/nilearn/nilearn/blob/main/setup.cfg	
depends=('python-lxml'
         'python-joblib>=1.0.0'
         'python-scipy>=1.6.0' 
         'python-numpy>=1.19.0' 
         'python-pandas>=1.1.5' 
         'python-scikit-learn>=1.0.0' 
         'python-nibabel>=3.2.0'
         'python-statsmodels')
makedepends=('python-setuptools')
optdepends=('python-matplotlib: for general plotting'
            'python-plotly: for surface plotting'
            'python-kaleido: required if using plotly')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nilearn/nilearn/archive/${pkgver}.tar.gz")
sha256sums=('b20764bd86750c8cce500c3b9b56177b7db324dcbf37d446a1ba5feced0f0b57')

build() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/nilearn-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1
}

