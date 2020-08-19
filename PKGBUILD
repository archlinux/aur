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
sha512sums=(
    SKIP
)

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

