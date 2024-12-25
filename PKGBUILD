# Maintainer: LoathingKernel < loathingkernel at gmail dot com >
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-hmmlearn
_pyname=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc='Hidden Markov Models in Python with scikit-learn like API'
arch=(x86_64)
url="https://hmmlearn.readthedocs.org"
license=('BSD-3-Clause')
depends=(python python-scikit-learn)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm
             pybind11
)
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_archive.tar.gz")

build() {
    cd "$_archive"
    python -m build -wn
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

sha256sums=('1d3c5dc4c5257e0c238dc1fe5387700b8cb987eab808edb3e0c73829f1cc44ec')
