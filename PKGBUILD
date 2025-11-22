# Maintainer: bastidest <bastidest at mailbox dot org>

_name=findsystemfontsfilename

pkgname=python-${_name,,}
pkgver=0.3.3
pkgrel=1
pkgdesc="Find the system fonts filename"
url="https://github.com/moi15moi/FindSystemFontsFilename/"
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c5b238da1690ea50676f318ba365d127b3b591aafd51834600160a242ab68498')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
