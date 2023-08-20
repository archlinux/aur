# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-torchist
_name=${pkgname#python-}
pkgver=0.2.1
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
sha256sums=('632af3e07e605312f429c35bb0f665f2a8d1ff11ac6fdf0ab02dadeddbef0cfb')

build() {
    cd "$srcdir/$_name-$pkgver"
    touch requirements.txt
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

