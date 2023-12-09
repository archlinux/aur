# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-qrcodegen
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
epoch=
pkgdesc="High quality QR Code generator library for Python"
arch=('any')
url="https://pypi.org/project/qrcodegen"
license=(MIT)
groups=()
depends=(python)
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.zip::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
noextract=()
sha256sums=('82db61f5065b6ba6d7606115b9413abdafdf3fe9c2810047100d08eced186e9e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
