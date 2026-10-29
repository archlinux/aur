# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-hijri-converter
_pkgname=${pkgname:7}
pkgver=2.3.2.post1
_sdist=hijri_converter
pkgrel=1
pkgdesc="Accurate Hijri-Gregorian dates converter based on the Umm al-Qura calendar"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
sha256sums=('986657ccd83a5beaf233ce5a219645747e885c45d4833bd2a8fa1b927fa39570')

build() {
    cd "${_sdist}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_sdist}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
