# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-lilcom-git
pkgver=1.2.1
pkgrel=1
pkgdesc="Lossy compression of floating-point NumPy arrays into byte strings."
arch=('any')
url='https://github.com/danpovey/lilcom'
license=('MIT')
depends=('python>=3.7'
         'python-numpy')
makedepends=('git' 'python-setuptools')
provides=('python-lilcom')
conflicts=('python-lilcom')
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

