# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-tzfpy
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Probably the fastest Python package to convert longitude/latitude to timezone name"
arch=('x86_64')
url="https://pypi.org/project/tzfpy/"
license=('APACHE')
groups=()
depends=()
makedepends=(python-build python-installer python-wheel maturin)
optdepends=()
provides=('python-tzfpy')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('c835e14042c7b2681830303f55367d28')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
