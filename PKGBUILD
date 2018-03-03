# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pypillowfight"
_pkgname="pypillowfight"
pkgver="0.2.3"
pkgrel="1"
pkgdesc="Library containing various image processing algorithms"
url="https://github.com/jflesch/libpillowfight"
depends=('python' )
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('50d3837c227b6153d34b826c0a940809')

build() {
    cd ${srcdir}/libpillowfight-${pkgver}
    make version
    python setup.py build
}

package() {
    cd ${srcdir}/libpillowfight-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
