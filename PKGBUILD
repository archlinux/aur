# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname=python-holidays
_pkgname=${pkgname:7}
pkgver=0.30
pkgrel=1
pkgdesc="Generate and work with holidays in Python"
arch=('any')
url="https://github.com/dr-prodigy/python-holidays"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python 'python-convertdate>=2.3.0' python-korean_lunar_calendar python-hijri-converter)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('eb40aae8236fa4ac7fe862dbcec3b10311c94c8310cea9e77e6b1aae63c312d4')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
