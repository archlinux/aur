# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname='python-types-pyaml'
_module='types-PyYAML'
_src_folder='types-PyYAML-6.0.12.12'
pkgver='6.0.12.12'
pkgrel=1
pkgdesc="Typing stubs for PyYAML"
url="https://github.com/python/typeshed"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache-2.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/af/48/b3bbe63a129a80911b60f57929c5b243af909bc1c9590917434bca61a4a3/types-PyYAML-6.0.12.12.tar.gz")
sha256sums=('334373d392fde0fdf95af5c3f1661885fa10c52167b14593eb856289e1855062')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
