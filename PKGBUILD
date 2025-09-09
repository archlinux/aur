# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-ultranest
_name=${pkgname#python-}
pkgver=4.4.0
pkgrel=1
pkgdesc="Fit and compare complex models reliably and rapidly with advanced sampling techniques."
arch=(any)
url="https://github.com/JohannesBuchner/ultranest"
license=(GPL3)
groups=()
depends=(python-numpy python-matplotlib python-corner)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dfebdc4b2bc0138238f65e8f957b70fe296cb094c895172f4a368e792a59b501')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

