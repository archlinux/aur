# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgname=wlc
pkgname=weblate-${_pkgname}
pkgver=1.14
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
md5sums=('d2bf9b118ab928c21cf39beaf22d6b65')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}
