# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-fiddle
_pyname=fiddle
pkgver=0.3.0
pkgrel=1
pkgdesc='Python-first configuration library (Google)'
arch=('any')
url='https://github.com/google/fiddle'
license=('Apache-2.0')
depends=(
    'python>=3.8'
    'python-absl'
    'python-graphviz'
    'python-libcst'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('5d083d3299a479868345513385a6c5546141bd92086c15d3dcbf8008a90075d3')

build() {
    cd "$_pyname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pyname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
