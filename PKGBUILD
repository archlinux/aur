# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-torchist
_name=${pkgname#python-}
pkgver=1.0.1
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
sha256sums=('8c5533ce07c3f35bcf23b2c03c2378bf132df2a59004cd529ffbf840137e12a5')

build() {
    cd "$srcdir/$_name-$pkgver"
    touch requirements.txt
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

