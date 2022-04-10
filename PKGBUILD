# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: ycatz <thesummernightcat@gmail.com>

pkgname=python-holidays
_pkgname=${pkgname:7}
pkgver=0.13
pkgrel=2
pkgdesc="Generate and work with holidays in Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python 'python-convertdate>=2.3.0' python-korean_lunar_calendar python-hijri-converter)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('c6f7c3ab8ada94806702da931d94d37cd61bcfa92cb4d39d351b6a9c5210675c')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
