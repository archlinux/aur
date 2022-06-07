# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-docrep
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=3
pkgdesc="A Python Module for intelligent reuse of docstrings"
arch=(any)
url="https://github.com/Chilipp/docrep"
license=('GPL')
groups=()
depends=()
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(ef6e7433716c0d2c59889aae8bff800b48e82d7e759dfd934b93100dc7bccaa1)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
