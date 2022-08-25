# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-docrep
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="A Python Module for intelligent reuse of docstrings"
arch=(any)
url="https://github.com/Chilipp/docrep"
license=('GPL')
groups=()
depends=()
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(ed8a17e201abd829ef8da78a0b6f4d51fb99a4cbd0554adbed3309297f964314)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
