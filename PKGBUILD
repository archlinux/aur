# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-jamo-git
pkgver=0.4.3
pkgrel=1
pkgdesc="Hangul syllable decomposition and synthesis using jamo"
arch=('any')
url='https://github.com/JDongian/python-jamo'
license=('Apache')
depends=('python>=3.6')
makedepends=('git' 'python-setuptools')
provides=('python-jamo')
conflicts=("python-jamo")
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

