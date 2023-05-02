# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-hijri-converter
_pkgname=${pkgname:7}
pkgver=2.3.1
pkgrel=2
pkgdesc="Accurate Hijri-Gregorian dates converter based on the Umm al-Qura calendar"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('069b6789291e0830f4860a79dcd34fb3ceea3b95516ed4010202b9656ba1ab61')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
