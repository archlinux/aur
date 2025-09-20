# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
pkgname='python-pymarshal'
_module=${pkgname#python-}
pkgver='2.2.3'
pkgrel=1
pkgdesc="Pythonic implementation of Golang's (un)marshalling of structs to/from various data serialization formats"
url="https://github.com/stargateaudio/pymarshal"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('43161a7b03dbc3b1e28630dbbab3684177502c691f10d21665fb0253a33f0bd2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
