# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname=python-holidays
_pkgname=${pkgname:7}
pkgver=0.20
pkgrel=1
pkgdesc="Generate and work with holidays in Python"
arch=('any')
url="https://github.com/dr-prodigy/python-holidays"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python 'python-convertdate>=2.3.0' python-korean_lunar_calendar python-hijri-converter)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('40befaf8823656900d0b6e5643e589193dbaf3ddb005d9347ba7fef94cce1b0a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
