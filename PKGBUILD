# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-dtw-python-git
pkgver=1.2.2
pkgrel=1
pkgdesc="Python port of R's Comprehensive Dynamic Time Warp algorithm package"
arch=('any')
url='https://github.com/DynamicTimeWarping/dtw-python'
license=('GPL3')
depends=('python>=3.6' 'python-numpy' 'python-scipy' 'cython')
makedepends=('git' 'python-setuptools')
provides=('python-dtw-python')
conflicts=("python-dtw-python")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s" "$(python setup.py --version)"
}


build() {
    cd "${pkgname}"
    python setup.py build
}


package() {
    cd "${pkgname}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

