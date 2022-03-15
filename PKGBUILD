# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-python
_name=${pkgname#python-}
pkgver=8.1.3
pkgrel=3
pkgdesc="The official Todoist Python API library"
arch=(any)
url="https://github.com/Doist/$_name"
license=('MIT')
groups=()
depends=(python-requests)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('00544a0395510fa8f28a0b9960fed6390396a87ab51a35336ee7b3d1fd74ef45')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

