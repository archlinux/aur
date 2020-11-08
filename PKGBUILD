# Maintainer: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-testsuite'
pkgver='24.0'
pkgrel=1
pkgdesc="Generic Testsuite Driver in Python"

arch=('any')
url="https://github.com/AdaCore/e3-testsuite"
license=('GPL3')

depends=('python-e3-core')
makedepends=('python-setuptools')

_name='e3-testsuite'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('5fdd8bd70c9b7b94685462f6a04444fd2ebdd9fb0cc9b4dab0cad9a195272ba961cf6d42687d1df9784f1fa542de64bdd9d50f1dcb7c6ff8fcc60e3219be89b5')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
