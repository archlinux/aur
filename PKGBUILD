# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-torchist
_name=${pkgname#python-}
pkgver=0.1.7
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
sha256sums=(b02c580326ee48d21eed5dd0b78f3523c845fa27998c652faaae147752ad73c1)

build() {
    cd "$srcdir/$_name-$pkgver"
    touch requirements.txt
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

