# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-types-urllib3
_pkgname=${pkgname:7}
pkgver=1.26.11
pkgrel=2
pkgdesc="Typing stubs for urllib3"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(Apache)
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('24d64e441168851eb05f1d022de18ae31558f5649c8f1117e384c2e85e31315b')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
