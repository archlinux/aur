# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyinsane2"
_pkgname="pyinsane"
pkgver="2.0.2"
pkgrel="2"
pkgdesc="Python implementation of the Sane API (using ctypes) and abstration layer"
arch=('any')
url="https://github.com/jflesch/pyinsane"
license=('GPL3')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-pillow' 'sane')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('39c66c6c7869d3495e195c2dc809ab82')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
