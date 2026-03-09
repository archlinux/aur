# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-lsqfit
_name=${pkgname#python-}
pkgver=13.3.1
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
sha256sums=('3a17e9411d8bb61af8e8e7f6c3620492f594d87b90b564561fd0acbe3adca6b1')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
