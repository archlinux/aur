# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-normalise-git
pkgver=0.1.9.r327
pkgrel=1
pkgdesc='Module for normalising text'
arch=('any')
url='https://github.com/EFord36/normalise'
license=('GPL3')
depends=('python>=3.7' 'python-nltk' 'python-roman' 'python-scikit-learn')
makedepends=('git' 'python-setuptools')
provides=('python-normalise')
conflicts=("python-normalise")
source=(
    "${pkgname}::git+${url}")
md5sums=(
    'SKIP')


pkgver() {
    cd "${pkgname}"
    printf "%s.r%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)"
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

