# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyinsane2"
_pkgname="pyinsane"
pkgver="2.0.8"
pkgrel="1"
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer"
arch=('any')
url="https://github.com/jflesch/pyinsane"
license=('GPL3')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-pillow' 'sane')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3e94d4c41eb94846b372c4cb628e92d8')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
