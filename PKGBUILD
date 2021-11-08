# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
pkgname='python-pymarshal'
_module=${pkgname#python-}
pkgver='2.2.0'
pkgrel=1
pkgdesc="Pythonic implementation of Golang's (un)marshalling of structs to/from various data serialization formats"
url="https://github.com/stargateaudio/pymarshal"
depends=('python')
makedepends=('python-setuptools' 'python-pytest-runner')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2f2377170261be43233375c9c2726fc9b8f9daacc75eb18458d2e1c6cd8578a2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
