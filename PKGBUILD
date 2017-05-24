# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-feather')
_module='feather'
pkgver='0.4.0'
pkgrel=1
pkgdesc="Fast, interoperable binary data frame storage for Python, R"
url="https://github.com/wesm/feather"
depends=('python'
    'python-pandas>=0.17.1'
    'python-pyarrow>=0.4.0')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/wesm/feather/archive/v$pkgver.tar.gz")
sha256sums=('62be8619cd56e5c4ba5c5095e01732ccb125ba56c83a4cba0f6e6293a5e4b348')

build() {
    cd "${srcdir}/${_module}-${pkgver}/python"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}/python"
    python setup.py install --root="${pkgdir}" --optimize=1
}
