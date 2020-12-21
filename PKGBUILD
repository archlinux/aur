# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-feather'
_module='feather'
pkgver=0.4.1
pkgrel=1
pkgdesc="Fast, interoperable binary data frame storage for Python, R"
url="https://github.com/wesm/feather"
depends=('python-pandas>=0.17.1'
    'python-pyarrow>=0.4.0')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wesm/feather/archive/v$pkgver.tar.gz")
sha256sums=('5e230cf7d270c73ac032498ae7f77c13c169ab89b845c4432e3a5f061b0287b3')

build() {
    cd "${_module}-${pkgver}/python"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}/python"
    python setup.py install --root="${pkgdir}" --optimize=1
}
