# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-icefall-git
pkgver=1.2.1
pkgrel=1
pkgdesc="Official recipes associated with k2 and lhotse"
arch=('any')
url='https://github.com/danpovey/lilcom'
license=('MIT')
depends=('python>=3.7'
         'python-kaldialign'
         'python-kaldilm'
         'python-sentencepiece'
         'tensorboard')
makedepends=('git' 'python-setuptools')
optdepends=('python-lhotse: Datasets')
provides=('python-icefall')
conflicts=('python-icefall')
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

