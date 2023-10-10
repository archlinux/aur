# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fundamentalanalysis
_pkgname=fundamentalanalysis
pkgver=0.3.1
pkgrel=1
pkgdesc="Fully-fledged Fundamental Analysis package"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-requests python-pandas)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6b3be0e456ac550b957ead85cf15e413c0c9e063877c6631dbca9dd09c4b8cd3')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
