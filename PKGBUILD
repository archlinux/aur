# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc="A neural network library and ecosystem for JAX designed for flexibility"
arch=(any)
url="https://github.com/google/flax"
license=('Apache')
groups=()
depends=(python-jax)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(064f33f24f49ecef01c171cc770d22493fb8f9a36ed29db5e75f82d2052682a9)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

