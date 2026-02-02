_module='xled'
pkgname=python-$_module
_src_folder='xled-0.7.0'
pkgver='0.7.0'
pkgrel=1
pkgdesc="XLED is a python library and command line interface (CLI) to control Twinkly - Smart Decoration LED lights for Christmas."
url=""
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-pytest-runner')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/x/xled/xled-0.7.0.tar.gz")
sha256sums=('da7e46475003e810addd662866e9295d5c6959e8f5537df8177826e7fe2e0ff8')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
