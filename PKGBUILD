pkgname='python-cqgridfinity'
_module='cqgridfinity'
_src_folder='cqgridfinity-0.5.7'
pkgver='0.5.7'
pkgrel=1
pkgdesc="A python library to make Gridfinity compatible objects with CadQuery."
url="https://github.com/michaelgale/cq-gridfinity"
depends=('python' 'python-cadquery' 'python-cqkit')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/c6/4e/9c320a0e51f388cdd74fa9fccd37a7a6d79c0b4a3f614793dfbdc922b656/cqgridfinity-0.5.7.tar.gz")
sha256sums=('845e87def1ec48182799fc9b8e121d5efcb68e59716fb519889efae65eab9ccc')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
