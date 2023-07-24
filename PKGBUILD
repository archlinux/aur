# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kibom
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=0
epoch=
pkgdesc="Bill of Materials generation tool for KiCad EDA"
arch=('any')
url="https://pypi.org/project/qrcodegen"
license=(MIT)
groups=()
provides=(kibom)
conflicts=(kibom)
depends=(python)
makedepends=(python-build
            python-installer
            python-wheel)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('89ad0fa95bb36bb6aaed666d9685c68974557febf96d51492a5b80d7803923ff')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
