# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-orderly-set
_name=${pkgname#python-}
pkgver=5.5.0
pkgrel=2
pkgdesc="Orderly Set is a package containing multiple implementations of Ordered Set"
arch=('x86_64')
url="https://pypi.org/project/orderly-set/"
license=('APACHE')
groups=()
depends=()
makedepends=(python-build python-installer python-wheel)
optdepends=()
provides=('python-orderly-set')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
noextract=()
md5sums=('bfb6f065e1b646f84636dfab39e0acbd')

build() {
    cd "${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name//-/_}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
