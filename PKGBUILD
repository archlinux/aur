# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-kaldialign-git
pkgver=0.2
pkgrel=1
pkgdesc='Edit distance computation functions from Kaldi.'
arch=('any')
url='https://github.com/pzelasko/kaldialign'
license=('Apache License 2.0')
depends=('python>=3.7' 'cython')
makedepends=('git' 'cython' 'python-setuptools')
provides=('python-kaldialign')
conflicts=("python-kaldialign")
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

