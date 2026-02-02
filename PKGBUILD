_module='vnoise'
pkgname=python-$_module
_src_folder='vnoise-0.1.0'
pkgver='0.1.0'
pkgrel=1
pkgdesc="vnoise is a pure-Python, Numpy-based, vectorized port of the noise library."
url=""
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-pytest-runner')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/v/vnoise/vnoise-0.1.0.tar.gz")
sha256sums=('831b529bc0c035edaf65218ee5c0586f4e8255452af8f6ddf003d80e7bf9c038')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
