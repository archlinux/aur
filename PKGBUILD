# Maintainer: Paul Irofti <paul@irofti.net>

_name="tods"
pkgname="python-$_name-git"
pkgver=r134.ac72b5f
pkgrel=2

pkgdesc="Automated Time-series Outlier Detection System"
url="https://github.com/datamllab/tods"
arch=('any')
license=('Apache')

depends=('python' 'python-jinja' 'python-numpy' 'python-simplejson'
    'python-scikit-learn' 'python-statsmodels' 'python-pywavelets'
    'python-pillow' 'python-tensorflow' 'python-keras-applications'
    'python-pyod' 'python-nimfa' 'python-stumpy' 'python-more-itertools'
    'python-tamu_d3m' 'python-tamu_axolotl')
makedepends=('git' 'python-setuptools')
provides=("python-$_name")
conflicts=("python-$_name")

source=("git+https://github.com/datamllab/tods")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_name"
  # last 5 lines are forcing pip install
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py" 
  sed -i '$d' "setup.py"
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
