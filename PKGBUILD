# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('python-pgzero')
_module='pgzero'
pkgver=1.2
pkgrel=2
pkgdesc="A zero-boilerplate 2D games framework"
url="http://pypi.python.org/pypi/pgzero"
depends=('python-numpy' 'python-pygame')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pgzero/pgzero-${pkgver}.tar.gz")
md5sums=('b627a2667ad7c2ccbe22c3875bbd2822')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
