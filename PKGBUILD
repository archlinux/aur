# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-kaldilm-git
pkgver=1.13
pkgrel=1
pkgdesc='Python wrapper for arpa2fst from the kaldi speech toolkit.'
arch=('any')
url='https://github.com/csukuangfj/kaldilm'
license=('Apache License 2.0')
depends=('python>=3.7' 'cython')
makedepends=('git' 'cython' 'python-setuptools')
provides=('python-kaldilm')
conflicts=("python-kaldilm")
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

