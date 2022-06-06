# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-flax
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=0
pkgdesc="A neural network library and ecosystem for JAX designed for flexibility"
arch=(any)
url="https://github.com/google/flax"
license=('Apache')
groups=()
depends=('python-jax')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(d4c179e343601c1443b4d3fdb1078ffa2531fa50e4853b439151c7c0373697e6)

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

