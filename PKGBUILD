# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgname=wlc
pkgname=weblate-${_pkgname}
pkgver=1.15
pkgrel=1
pkgdesc="Weblate commandline client"
arch=('any')
url="https://weblate.org"
license=('GPL3')
depends=('python-dateutil'
         'python-requests'
         'python-xdg'
         'python-argcomplete')
makedepends=('python-setuptools')
install="${pkgname}.install"
source=("https://github.com/WeblateOrg/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('71687cfcb546b1ceab11605d37d3dc10')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}
