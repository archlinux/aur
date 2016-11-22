# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyinsane2"
_pkgname="pyinsane"
pkgver="2.0.7"
pkgrel="1"
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer"
arch=('any')
url="https://github.com/jflesch/pyinsane"
license=('GPL3')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-pillow' 'sane')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('688b8273d225b9fcc00ec71d91e48ae2')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
