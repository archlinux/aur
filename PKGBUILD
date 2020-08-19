# Maintainer Ruijie Yu (first.last@outlook.com)

pkgname=python-nptyping
_pkgname="${pkgname#python-}"
pkgver=1.3.0
pkgrel=1
pkgdesc='Type hints for Numpy.'
url="https://github.com/ramonhagenaars/nptyping"
arch=(any)
license=(MIT)

depends=(
    'python>=3.5'
    'python-numpy'
    'python-typish>=1.5.2'
)

makedepends=(
    'python-pip'
    # 'python-wheel'
)

checkdepends=(
    'python-pycodestyle'
    'python-pylint'
    'python-pytest'
    'python-coverage'
    # 'python-codecov'
)

source=(
    'https://github.com/ramonhagenaars/nptyping/archive/v1.3.0.tar.gz'
)
sha512sums=('05dc5e22c2d71dbff3fdb5fb086d627a03e912d2ed43a64c0522675f8334212afd7105bd09723bc1f09d59c968de8a96ef6e9ee11cb508cb1db301f22fa1b96e')

_extracted="$_pkgname-$pkgver/"

check() {
    ## how do we "test" with python/pip?
    ## `./setup.py test` seems to be deprecated

    # python "$srcdir/$_extracted/setup.py" test
    :
}

package() {
    pip install --no-deps --root "${pkgdir}" --compile "$srcdir/$_extracted"
}

