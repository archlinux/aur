# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-lsqfit
_name=${pkgname#python-}
pkgver=13.0.4
pkgrel=1
pkgdesc="conditional density estimation"
arch=(any)
url="https://github.com/gplepage/lsqfit"
license=(GPL3)
groups=()
depends=(python-numpy python-gvar)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9f834867eb637c4ece88031cc06e0cc5c424b6bb7986b6fce89f545d32359ad')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
