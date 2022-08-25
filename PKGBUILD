# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.6.0
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
sha256sums=(6d9bc9d5e86291610e646c945a314912a8769508aa95ed751790f983f6e29c3d)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

