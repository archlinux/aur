# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-torchist
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="The torchist package implements NumPy's histogram and histogramdd functions in PyTorch with support for non-uniform binning."
arch=(any)
url="https://github.com/francois-rozet/torchist"
license=('MIT')
groups=()
depends=(python-pytorch)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('56423cceb5deb843faaa8b4dbbefc4a6b5ea72a5d5f49b43dc26f32f616d182b')

build() {
    cd "$srcdir/$_name-$pkgver"
    touch requirements.txt
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

