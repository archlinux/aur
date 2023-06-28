# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname=python-holidays
_pkgname=${pkgname:7}
pkgver=0.27.1
pkgrel=1
pkgdesc="Generate and work with holidays in Python"
arch=('any')
url="https://github.com/dr-prodigy/python-holidays"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python 'python-convertdate>=2.3.0' python-korean_lunar_calendar python-hijri-converter)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5d9a7ca1763cfa3d329b88b66b591a12dc4267302428a7cf158136d0310eaeec')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
