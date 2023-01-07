# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname=python-holidays
_pkgname=${pkgname:7}
pkgver=0.18
pkgrel=2
pkgdesc="Generate and work with holidays in Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python 'python-convertdate>=2.3.0' python-korean_lunar_calendar python-hijri-converter)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('e94d9d3536ff1a2a70d6d2f56cb055eb9a95d0b9a3a5fb81b9e8f9d36e333789')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
