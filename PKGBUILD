pkgname='python-daal4py'
_module='daal4py'
_src_folder='daal4py-2024.7.0'
pkgver='2024.7.0'
pkgrel=1
pkgdesc="daal4py is a Convenient Python API to the Intel® oneAPI Data Analytics Library (oneDAL)"
url="https://github.com/IntelPython/daal4py"
depends=('python' 'python-daal')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/b7/5e/0ff67fb72fc1dec29540a3bd6ebd6569010883143239649a09e185409f66/daal4py-2024.7.0-py310-none-manylinux1_x86_64.whl")
sha256sums=('d29477f5eb5811fe9fff8acacb8ca79615601c4a32ba7cfd5e950274c1675524')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
