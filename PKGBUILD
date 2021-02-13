# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-tods-git"
pkgver=r134.ac72b5f
pkgrel=1
pkgdesc="Automated Time-series Outlier Detection System"
url="https://github.com/datamllab/tods"
depends=('python' 'python-jinja' 'python-numpy' 'python-simplejson'
    'python-scikit-learn' 'python-statsmodels' 'python-pywavelets'
    'python-pillow' 'python-tensorflow' 'python-keras-applications'
    'python-pyod' 'python-nimfa' 'python-stumpy' 'python-more-itertools')
makedepends=('git' 'python-setuptools')
provides=('python-tods')
conflicts=('python-tods')
arch=('any')
license=('Apache')
source=("git+https://github.com/datamllab/tods")
md5sums=('SKIP')

pkgver() {
  cd "tods"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "tods"
  # last 5 lines are forcing pip install
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py"
}

build() {
  cd "tods"
  python setup.py build
}

package() {
  cd "tods"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
