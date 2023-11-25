# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kibom
_name=${pkgname#python-}
pkgver=1.9.1
pkgrel=1
epoch=
pkgdesc="Bill of Materials generation tool for KiCad EDA"
arch=('any')
url="https://pypi.org/project/kibom"
license=(MIT)
groups=()
provides=(kibom)
conflicts=(kibom)
depends=(
    python
    python-xlsxwriter)
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('48c44b30223913121a562ddebf07d5d915dd08de2cdf33126211f58511d2fc05')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
