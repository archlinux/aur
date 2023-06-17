# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-ninja-syntax
pkgver=1.7.2
pkgrel=5
pkgdesc='Python module for generating .ninja files'
arch=('any')
url='https://pypi.python.org/pypi/ninja_syntax/'
license=('APACHE')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
_name=ninja_syntax
source=("${pkgname}-${pkgver}.tar.gz"::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('342dc97b9e88a6495bae22953ee6063f91d2f03db6f727b62ba5c3092a18ef1f')

build() {
    cd "ninja_syntax-${pkgver}"
    python -m build --wheel --no-isolation
}

package_python-ninja-syntax() {
    python -m installer --destdir="$pkgdir" "ninja_syntax-${pkgver}/dist"/*.whl
}
