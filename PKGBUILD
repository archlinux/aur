# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-kaldiio-git
pkgver=2.18.0
pkgrel=1
pkgdesc='Pure Python module for reading and writing kaldi ark files'
arch=('any')
url='https://github.com/nttcslab-sp/kaldiio'
license=('custom:NTT')
depends=('python>=3.7' 'python-pytorch-complex-git' 'python-numpy')
makedepends=('git' 'python-setuptools')
provides=('python-kaldiio')
conflicts=("python-kaldi-io")
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

