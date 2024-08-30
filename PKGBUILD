# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_name=pint-xarray
pkgname=python-${_name}
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="A convenience wrapper for using pint with xarray."
arch=("any")
url="https://github.com/xarray-contrib/pint-xarray"
license=('Apache')
groups=()
depends=("python" "python-numpy" "python-xarray" "python-pint")
makedepends=(
    "python-build" "python-installer"  "python-wheel"
    # "python-setuptools" "python-setuptools-scm"
)
checkdepends=("python-pytest")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xarray-contrib/pint-xarray/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6a7b7f6721e052938bd7e4ab3acdacd6ee81aff7401052a35f04073afaa84a0c')
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
    pytest
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # python setup.py install --root="$pkgdir" --optimize=1
}

