# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-valinvest
_pkgname=${pkgname:7}
pkgver=0.0.2
pkgrel=2
pkgdesc="A value investing tool based on Warren Buffett, etc"
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
makedepends=(python-build python-installer python-wheel)
depends=(python python-certifi)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('9614aaf8019e015c20ea48867ede8a6ea10e1c6410e787314066d7b2e5aeb7dc')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm $pkgdir/usr/lib/python3.10/site-packages/tests -r
}
