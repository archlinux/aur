# Maintainer: weipeng <weipeng1999@qq.com>
_name="properscoring"
pkgname=python-${_name}
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Proper scoring rules for evaluating probabilistic forecasts in Python."
arch=("any")
url="https://github.com/properscoring/properscoring"
license=('Apache-2.0')
groups=()
depends=("python" "python-numpy" "python-scipy")
makedepends=(
    "python-build" "python-installer"  "python-wheel"
    # "python-setuptools" "python-setuptools-scm"
)
checkdepends=("python-nose")
optdepends=("python-numba")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('55564e97da32c4db6ba05926d403a5c0fdfa4655fc4ed125c40095a8bd7484a4')
validpgpkeys=()

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
    # python setup.py build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    # nosetests
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # python setup.py install --root="$pkgdir" --optimize=1
}

