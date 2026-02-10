# Maintainer: Riderius <riderius.help@gmail.com>
# Previous maintainer: Wu Zhenyu <wuzhenyu@ustc.edu> (https://aur.archlinux.org/account/Freed)

pkgname=python-argopt
pkgver=0.9.1
pkgrel=1
pkgdesc="doc to argparse driven by docopt"
arch=(any)
url=https://github.com/casperdcl/argopt
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools python-setuptools-scm)
checkdepends=(python-nose)
license=(MPL-2.0)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('42a08f3467650252089e8abf4175bfdc7060328173b87c11bc154eec14afa7e9')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check(){
    cd "$srcdir/$pkgname"
    nosetests
}
