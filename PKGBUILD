# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-fastkde
_name=${pkgname#python-}
pkgver=1.0.20
pkgrel=2
pkgdesc="Fast kernel density estimation"
arch=(any)
url="https://github.com/LBL-EESA/fastkde"
license=(LBNL)
groups=()
depends=(python-numpy python-scipy cython)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(6b8256739e216d04c4283afa32f207981a0a1b5c1e6d9242675577f77fd00aab)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

