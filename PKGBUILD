# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-suod-git"
pkgver=r134.560b49a
pkgrel=2
pkgdesc="Scalable Unsupervised Outlier Detection"
url="https://github.com/yzhao062/suod"
depends=('python' 'python-joblib' 'python-matplotlib' 'python-numpy'
    'python-scipy' 'python-scikit-learn' 'python-psutil')
makedepends=('git' 'python-setuptools')
provides=('python-suod')
conflicts=('python-suod')
arch=('any')
license=('BSD')
source=("git+https://github.com/yzhao062/suod.git")
md5sums=('SKIP')

pkgver() {
    cd "suod"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "suod"
    rm examples/__init__.py
}
 
build() {
    cd "suod"
    python setup.py build
}

package() {
  cd "suod"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
