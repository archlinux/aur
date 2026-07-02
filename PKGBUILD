# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgname=wlc
pkgname=weblate-${_pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="Weblate commandline client"
arch=('any')
url="https://weblate.org"
license=('GPL3')
depends=('python-dateutil'
         'python-requests'
         'python-xdg'
         'python-argcomplete')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install="${pkgname}.install"
source=("https://github.com/WeblateOrg/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('608ace27f6a4a677d2a8980bb89f9183')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

