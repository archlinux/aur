# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-unimpeded
_name=${pkgname#python-}
pkgver=1.2.4
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
sha256sums=('dc67c1a62e1c0e2bcc6ffe1ec562ad05f364d7f82486ddb7564e77b239fd6251')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

