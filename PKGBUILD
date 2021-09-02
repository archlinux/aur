# Maintainer: Lumaku <lumaku@mailbox.org>
pkgname=python-g2p-git
pkgver=2.0.0
pkgrel=1
pkgdesc='English grapheme to phoneme conversion'
arch=('any')
url='https://github.com/Kyubyong/g2p'
license=('Apache 2.0')
depends=('python>=3.7' 'python-numpy' 'python-nltk' 'python-inflect')
makedepends=('git' 'python-setuptools')
provides=('python-g2p')
conflicts=("python-g2p")
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

