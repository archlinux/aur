# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_name=cf-xarray
pkgname=python-${_name}
pkgver=0.8.1
pkgrel=1
epoch=
pkgdesc="A lightweight convenience wrapper for using CF attributes on xarray objects."
arch=('any')
url="https://github.com/xarray-contrib/cf-xarray"
license=('Apache')
groups=()
depends=("python-dask" "python-matplotlib" "python-netcdf4" "python-pandas" "python-pooch" "python-xarray")
makedepends=("python-build" "python-installer" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-cov" "python-pytest-xdist")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('4a079a9015f7a46c11792f07bb73610eb0e337daf21b63dc03201ae92ab0996a')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_name}-${pkgver}"
}

build() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}-${pkgver}"
    # pytest # can not test due to network requirement
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

