# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-unimpeded
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Universal model comparison & parameter estimation over diverse datasets"
arch=(any)
url="https://github.com/handley-lab/unimpeded"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(unimpeded)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5d4b0ce751f1f476b596393f71834a777fdf8810ad68690c373b08e365b54ae8')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

