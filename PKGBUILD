# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-anesthetic
_name=${pkgname#python-}
pkgver=2.0.0b43
pkgrel=1
pkgdesc="nested sampling post-processing"
arch=(any)
url="https://github.com/handley-lab/anesthetic"
license=(MIT)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas)
makedepends=(python-build python-installer)
provides=(anesthetic)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('450b3f9253fcd3d9d6999c5aad85f948539e1195d9b364b44be46078f5f1cc84')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

